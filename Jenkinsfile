pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', changelog: false, credentialsId: '29265e27-1dfa-430d-91cd-0583b7539ebe', poll: false, url: 'https://github.com/Kimmigs/week_0.git'
            }
        }
        stage('Terraform Init') {
            environment {
                AWS_DEFAULT_REGION    = 'us-east-1'
                SECRET_FILE_ID = credentials('1fef9a45-bc71-422c-a6b4-3107979f80f2')
            }
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Upload State to S3') {
            steps {
                script {
                    sh 'aws s3 cp terraform.tfstate s3://tf-remote-s3-bucket-kim-changehere'
                }
            }
        }
    }
} 