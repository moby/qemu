pipeline {
  agent {
      label 'linux && amd64 && docker'
  }
  parameters {
    booleanParam(name: "push", defaultValue: false)
  }
  options {
    timeout(time: 1, unit: 'HOURS')
    timestamps()
    ansiColor('xterm')
  }
  stages {
    stage('build') {
      steps {
        sh 'docker build -t docker/qemu:${GIT_COMMIT} .'
      }
    }
    stage('push') {
      when {
        beforeAgent true
        expression { params.push }
      }
      steps {
        withDockerRegistry([credentialsId: 'fb721cc7-c508-4691-b6a4-403337e42ecc', url: "https://index.docker.io/v1/"]) {
          sh 'docker push docker/qemu:${GIT_COMMIT}'
        }
      }
    }
  }
}
