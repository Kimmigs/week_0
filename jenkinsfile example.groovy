pipeline {
    agent any
    stages {
        stage('Example') {
            environment {
                IAM_INFO=credentials('iam-role-credentials')
                AWS_REGION='us-west-2'
            }

            steps {
                withAWS(role: env.IAM_INFO_PSW,
                        roleAccount: env.IAM_INFO_USR,
                        region: env.AWS_REGION) {
                    sh "aws help"
                }
            }
        }
    }
}

