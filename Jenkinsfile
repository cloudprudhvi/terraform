pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Approval') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'master') {
                        input message: 'Do you want to apply this plan?', ok: 'Apply'
                    } else {
                        echo 'Skipping apply because it is not the main/master branch.'
                    }
                }
            }
        }

        stage('Apply') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'master') {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'rm -f tfplan'
        }
        failure {
            echo 'The pipeline failed!'
        }
    }
}
