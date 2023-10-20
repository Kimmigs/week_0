pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    environment {
        AWS_DEFAULT_REGION    = 'us-east-1'
        IAM_INFO              = credentialsID: '387b4a4f-4357-4633-aedf-7f2094eb2c95'
        
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