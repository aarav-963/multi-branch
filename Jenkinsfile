```groovy
pipeline {

    agent {
        label 'qa'
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Running QA Pipeline"
                echo "Branch: ${BRANCH_NAME}"
                echo "Node: ${NODE_NAME}"

                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."

                sh '''
                    docker build -t qa-apache:latest .
                '''
            }
        }

        stage('Create Container') {
            steps {
                echo "Creating Docker container..."

                sh '''
                    docker rm -f c1 2>/dev/null || true
                    docker run -d --name c1 -p 80:80 qa-apache:latest
                '''
            }
        }

        stage('Verify Container') {
            steps {
                sh '''
                    echo "Running containers:"
                    docker ps

                    echo "Container details:"
                    docker inspect c1
                '''
            }
        }
    }

    post {
        success {
            echo "QA Pipeline completed successfully"
        }

        failure {
            echo "QA Pipeline failed"
        }
    }
}
```
