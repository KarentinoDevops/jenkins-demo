pipeline {
  agent any

  environment {
    IMAGE_NAME = "karentinodevops/jenkins-demo"
    IMAGE_TAG  = "latest"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker version'
        sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
      }
    }

    stage('Login to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-token', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 
'DOCKERHUB_TOKEN')]) {
          sh '''
            echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USER" --password-stdin
          '''
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
      }
    }
  }
}
