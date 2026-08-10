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

        stage('Process QA Files') {
            steps {
                echo "Processing files on QA machine"

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
            echo "QA Pipeline completed successfully"
        }

        failure {
            echo "QA Pipeline failed"
        }
    }
}
