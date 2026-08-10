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

        stage('Process PROD Files') {
            steps {
                echo "Processing files on PROD machine"

                sh '''
                    echo "Current branch:"
                    git branch --show-current

                    echo "Files:"
                    ls -la
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
