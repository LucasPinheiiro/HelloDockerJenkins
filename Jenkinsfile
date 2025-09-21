pipeline {
  agent any
  options { timestamps() }   // keep it simple; no ansiColor needed

  stages {
    stage('Check Docker') {
      steps {
        bat '''
          echo === whoami ===
          whoami
          echo === docker version ===
          docker version
        '''
      }
    }

    stage('Build image') {
      steps {
        // builds from repo root where Dockerfile lives
        bat 'docker build -t olaunicamp:%BUILD_NUMBER% .'
      }
    }

    stage('Run') {
      steps {
        // runs and prints "Olá Unicamp" in the console
        bat 'docker run --rm --name olaunicamp-%BUILD_NUMBER% olaunicamp:%BUILD_NUMBER%'
      }
    }
  }

  post {
    always {
      // Best-effort clean-up (ignore errors if image/container not found)
      bat 'docker rm -f olaunicamp-%BUILD_NUMBER% 2>NUL || ver >NUL'
      bat 'docker rmi olaunicamp:%BUILD_NUMBER% 2>NUL || ver >NUL'
      cleanWs()
    }
  }
}
