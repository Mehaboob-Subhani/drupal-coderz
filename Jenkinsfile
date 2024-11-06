pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }

    environment {
        GIT_CREDENTIALS_ID = 'ms-bit'
    }

    stages {
        stage('Clone repository') { 
            steps { 
                script {
                    checkout scm
                }
            }
        }

        stage('Prepare Environment on drupal-coderz-1') {
            when {
                branch 'main'
            }
            steps {
                script {
                        sh """
                        chmod -R 777 /var/www/drupal-script/
                        cd /var/www/drupal-script/
                        bash ./main_deploy_cypress_rollback_drupal.sh
                        exit
                        EOF
                        """
                }
            }
        }

        stage('Prepare Environment on drupal-coderz-2') {
            when {
                branch 'stage'
            }
            steps {
                script {
                        sh """
                        chmod -R 777 /var/www/drupal-script/
                        cd /var/www/drupal-script/
                        bash ./stage_deploy_cypress_rollback_prj.sh
                        exit
                        EOF
                        """
                }
            }
        }

        
        stage('Prepare Environment on drupal-coderz-3') {
            when {
                branch 'stage'
            }
            steps {
                script {
                        sh """
                        chmod -R 777 /var/www/drupal-script/
                        cd /var/www/drupal-script/
                        bash ./stage_deploy_cypress_rollback_prj.sh
                        exit
                        EOF
                        """
                }
            }
        }

        stage('Prepare Environment on drupal-coderz-3') {
            when {
                branch 'stage'
            }
            steps {
                script {
                        sh """
                        chmod -R 777 /var/www/drupal-script/
                        cd /var/www/drupal-script/
                        bash ./stage_deploy_cypress_rollback_prj.sh
                        exit
                        EOF
                        """
                }
            }
        }

        stage('Manual Approval') {
            when {
                branch 'master'
            }
            steps {
                input message: 'Approve deployment to Production?', ok: 'Deploy'
            }
        }

        stage('Prepare Environment on Production') {
            when {
                branch 'master'
            }
            steps {
                script {
                        sh """
                        chmod -R 777 /var/www/drupal-script/
                        cd /var/www/drupal-script/
                        bash ./master_deploy_cypress_rollback_prj.sh
                        exit
                        EOF
                        """
                    }
                }
            }       
        
        stage('Checkout code') {
            steps {
                script {
                    def scmVars = checkout([
                        $class: 'GitSCM',
                    ])

                    echo "scmVars.GIT_COMMIT"
                    echo "${scmVars.GIT_COMMIT}"

                    env.GIT_COMMIT = scmVars.GIT_COMMIT
                    echo "env.GIT_COMMIT"
                    echo "${env.GIT_COMMIT}"
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Cleans workspace after pipeline finishes
            emailext to: "ahamedsubhani12@gmail.com",
                subject: "jenkins build:${currentBuild.currentResult}: ${env.JOB_NAME}",
                body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}"
        }
    }
}


3b3268f1f9314557a05a4b99dfd62ee9

JENKINS_URL/multibranch-webhook-trigger/invoke?token=[Trigger token] 