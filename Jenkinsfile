pipeline {
  agent any

  environment {
    IMAGE_NAME = "karentinodevops/jenkins-demo"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Set tags') {
      steps {
        script {
          SHORT_SHA = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
          BUILD_TAG = "build-${env.BUILD_NUMBER}"
        }
        echo "SHORT_SHA=${SHORT_SHA}"
        echo "BUILD_TAG=${BUILD_TAG}"
      }
    }

    stage('Build image') {
      steps {
        sh """
          docker build -t ${IMAGE_NAME}:latest \
                       -t ${IMAGE_NAME}:${BUILD_TAG} \
                       -t ${IMAGE_NAME}:${SHORT_SHA} .
        """
      }
    }

    stage('Login to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-token', usernameVariable: 'DH_USER', passwordVariable: 
'DH_PASS')]) {
          sh '''
            echo "$DH_PASS" | docker login -u "$DH_USER" --password-stdin
          '''
        }
      }
    }

    stage('Push image') {
      steps {
        sh """
          docker push ${IMAGE_NAME}:latest
          docker push ${IMAGE_NAME}:${BUILD_TAG}
          docker push ${IMAGE_NAME}:${SHORT_SHA}
        """
      }
    }
  }
} 
