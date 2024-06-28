pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
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
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Apply') {
            environment {
                AWS_DEFAULT_REGION    = 'us-east-1'
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Upload State to S3') {
            environment {
                AWS_DEFAULT_REGION    = 'us-east-1'

            steps {
                script {
                    sh 'aws s3 cp terraform.tfstate s3://tf-remote-s3-bucket-kim-changehere'
                }
            }
        }
    }
} 
