pipeline {

    agent none

    stages {

        stage('Checkout') {
            agent {
                label "${env.BRANCH_NAME}"
            }

            steps {
                echo "Building branch: ${env.BRANCH_NAME}"
                echo "Running on node: ${env.NODE_NAME}"

                checkout scm
            }
        }

        stage('Verify Branch') {
            agent {
                label "${env.BRANCH_NAME}"
            }

            steps {
                script {

                    if (env.BRANCH_NAME == 'prod') {

                        echo "===================================="
                        echo "PRODUCTION PIPELINE"
                        echo "Branch : ${env.BRANCH_NAME}"
                        echo "Node   : ${env.NODE_NAME}"
                        echo "===================================="

                    } 
                    else if (env.BRANCH_NAME == 'qa') {

                        echo "===================================="
                        echo "QA PIPELINE"
                        echo "Branch : ${env.BRANCH_NAME}"
                        echo "Node   : ${env.NODE_NAME}"
                        echo "===================================="

                    } 
                    else {

                        error("Unsupported branch: ${env.BRANCH_NAME}")
                    }
                }
            }
        }

        stage('Process Files') {
            agent {
                label "${env.BRANCH_NAME}"
            }

            steps {
                script {

                    if (env.BRANCH_NAME == 'prod') {

                        echo "Files from PROD branch are available on PROD node."

                        sh '''
                            echo "Current branch:"
                            git branch --show-current

                            echo "Files:"
                            ls -la
                        '''

                    } 
                    else if (env.BRANCH_NAME == 'qa') {

                        echo "Files from QA branch are available on QA node."

                        sh '''
                            echo "Current branch:"
                            git branch --show-current

                            echo "Files:"
                            ls -la
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully for ${env.BRANCH_NAME}"
        }

        failure {
            echo "Pipeline failed for ${env.BRANCH_NAME}"
        }
    }
}
