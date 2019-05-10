FROM ubuntu:18.04 AS build

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        git \
        libtool \
        libpixman-1-dev \
        libglib2.0-dev \
        pkg-config \
        python

WORKDIR /qemu

COPY . /qemu

RUN ./configure \
        --prefix=/usr \
        --enable-linux-user \
        --disable-system \
        --static \
        --disable-blobs \
        --disable-bluez \
        --disable-brlapi \
        --disable-cap-ng \
        --disable-capstone \
        --disable-curl \
        --disable-curses \
        --disable-docs \
        --disable-gcrypt \
        --disable-gnutls \
        --disable-gtk \
        --disable-guest-agent \
        --disable-guest-agent-msi \
        --disable-libiscsi \
        --disable-libnfs \
        --disable-mpath \
        --disable-nettle \
        --disable-opengl \
        --disable-sdl \
        --disable-spice \
        --disable-tools \
        --disable-vte \
        --target-list="aarch64-linux-user arm-linux-user ppc64le-linux-user s390x-linux-user"

RUN make -j "$(getconf _NPROCESSORS_ONLN)"

RUN mkdir /out && \
    cp aarch64-linux-user/qemu-aarch64 /out && \
    cp arm-linux-user/qemu-arm /out && \
    cp ppc64le-linux-user/qemu-ppc64le /out && \
    cp s390x-linux-user/qemu-s390x /out

FROM scratch
COPY --from=build /out /usr/bin
