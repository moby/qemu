
 This is a fork of qemu/qemu for Docker.  The organization is as follows:

* [branch] - read-only mirror of original qemu/qemu branch - no additinal changes here
* [moby/branch] - based on [branch] but contains Docker specific and un-upstreamed changes.

* [moby/master] - this is the main development branch.
* [moby/master-alpine] - [moby/master] with alpine changes on top
* [moby/vX.Y.Z] - these are release branches created from qemu tags (i.e. v3.1.0)
* [moby/vX.Y.Z-alpine] - with alpine on top

 The default branch is [moby/master].

 In general, we follow the practices as documented in:

https://github.com/linuxkit/linuxkit/blob/master/docs/kernels.md#working-with-linux-kernel-patches-for-linuxkit

