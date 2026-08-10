pipeline {

    agent {
        label 'prod'
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Running PROD Pipeline"
                echo "Branch: ${BRANCH_NAME}"
                echo "Node: ${NODE_NAME}"

                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building PROD Docker image..."

                sh '''
                    sudo docker build -t prod-apache:latest .
                '''
            }
        }

        stage('Create Container') {
            steps {
                echo "Creating PROD Docker container..."

                sh '''
                    sudo docker rm -f c1 2>/dev/null || true
                    sudo docker run -d --name c1 -p 80:80 prod-apache:latest
                '''
            }
        }

        stage('Verify Container') {
            steps {
                sh '''
                    echo "Running containers:"
                    sudo docker ps

                    echo "Container details:"
                    sudo docker inspect c1
                '''
            }
        }
    }

    post {
        success {
            echo "PROD Pipeline completed successfully"
        }

        failure {
            echo "PROD Pipeline failed"
        }
    }
}
