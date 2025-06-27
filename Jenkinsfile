pipeline {
    agent any

    environment {
        IMAGE_NAME = 'crayonthree/hello-world-python'
        DOCKERHUB_CREDENTIALS_ID = 'dockerhub-creds'
    }

    stages {
        stage('Abhiroop - Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Abhiroop - Login to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS_ID}") {
                        echo 'Logged in to DockerHub'
                    }
                }
            }
        }

        stage('Abhiroop - Push image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS_ID}") {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}