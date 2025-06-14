pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "heni1123/flask-devops-app"
        DOCKER_TAG = "latest"
        CONTAINER_NAME = "flask-devops-app"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Clonage du dépôt Git..."
                git url: 'https://github.com/heni1123/flask-devops-app.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Construction de l'image Docker..."
                script {
                    docker.build("${env.DOCKER_IMAGE}:${env.DOCKER_TAG}")
                }
            }
        }

        stage('Stop and Remove old container if exists') {
            steps {
                echo "Arrêt et suppression du container précédent si existant..."
                script {
                    sh """
                    if [ \$(docker ps -aq -f name=${CONTAINER_NAME}) ]; then
                      docker stop ${CONTAINER_NAME} || true
                      docker rm ${CONTAINER_NAME} || true
                    else
                      echo "Aucun container existant à supprimer."
                    fi
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Lancement du container Docker..."
                script {
                    sh "docker run -d -p 5000:5000 --name ${CONTAINER_NAME} ${env.DOCKER_IMAGE}:${env.DOCKER_TAG}"
                }
            }
        }

        stage('Test Application') {
            steps {
                echo "Vérification que le container tourne..."
                script {
                    sh "docker ps -f name=${CONTAINER_NAME}"
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
