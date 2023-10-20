pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    environment {
        AWS_DEFAULT_REGION    = 'us-east-1'
        SECRET_FILE_ID = C:\Users\18432\week_0\.aws\credentials
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', changelog: false, credentialsId: '29265e27-1dfa-430d-91cd-0583b7539ebe', poll: false, url: 'https://github.com/Kimmigs/week_0.git'
            }
        }
        stage('Terraform Init') {
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