pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello from Jenkins!'
            }
        }

        stage('System Info') {
            steps {
                sh '''
                  echo "Date:"
                  date
                  echo "User:"
                  whoami
                  echo "Files:"
                  ls -la
                '''
            }
        }
    }
}
// change
