pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "heni1123/flask-devops-app"
        DOCKER_TAG = "latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/heni1123/flask-devops-app.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.DOCKER_IMAGE}:${env.DOCKER_TAG}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d -p 5000:5000 --name flask-devops-app ${env.DOCKER_IMAGE}:${env.DOCKER_TAG}"
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline terminée"
        }
    }
}
