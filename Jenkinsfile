pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh '''
                  docker version
                  docker build -t jenkins-demo:latest .
                '''
            }
        }
    }
}
