pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'production', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')
    }

    environment {
       AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
       AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    tools {
       terraform 'terraform'
    }
    
    stages {

        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'Github-auth-devops', url: 'https://github.com/mustafaabdelbadea/DevOps-Task'
                sh 'cp -rd  ./terraform/* . && rm -rf terraform '
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init -reconfigure'
            }
        }

        stage('terraform plan') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            
            steps{
                sh 'ls'
                sh 'terraform workspace select ${environment} || terraform workspace new ${environment}'
                sh 'terraform plan --var-file=prod.tfvars'
            }
        }
        stage('terraform apply') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }

            steps{
                sh 'terraform apply  --var-file=prod.tfvars --auto-approve'
            }
        }
        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }
        
            steps {
                sh "terraform destroy --var-file=prod.tfvars --auto-approve"
            }
        }
    }

    post {
        success {
            slackSend channel: 'jenkins-iti', color: '#00FF00', message: 'Build terraform code successfully, Job:${env.JOB_NAME} ${env.BUILD_NUMBER}'  
        }
        
        failure {
            slackSend channel: 'jenkins-iti', color: '#FF0000', message: 'Build terraform code failed, Job: ${env.JOB_NAME} ${env.BUILD_NUMBER}}'  
        }
    }
 }


// pipeline {
//     agent any

//     parameters {
//         string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
//         booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
//         booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')

//     }

//     stages {
//         stage('checkout') {
//             steps {
//                  script{
//                         dir("terraform")
//                         {
//                             git branch: 'main', credentialsId: 'github', url: 'https://github.com/mustafaabdelbadea/Bastion-host-terraform'}
//                         }
//                     }
//                 }
//             }

//         stage('Plan') {
//             when {
//                 not {
//                     equals expected: true, actual: params.destroy
//                 }
//             }
            
//             steps {
//                 sh 'terraform init -input=false'
//                 sh 'terraform workspace select ${environment} || terraform workspace new ${environment}'

//                 sh "terraform plan -input=false -out tfplan "
//                 sh 'terraform show -no-color tfplan > tfplan.txt'
//             }
//         }
//         stage('Approval') {
//            when {
//                not {
//                    equals expected: true, actual: params.autoApprove
//                }
//                not {
//                     equals expected: true, actual: params.destroy
//                 }
//            }
           
                
            

//            steps {
//                script {
//                     def plan = readFile 'tfplan.txt'
//                     input message: "Do you want to apply the plan?",
//                     parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
//                }
//            }
//        }

//         stage('Apply') {
//             when {
//                 not {
//                     equals expected: true, actual: params.destroy
//                 }
//             }
            
//             steps {
//                 sh "terraform apply -input=false tfplan"
//             }
//         }
        
//         stage('Destroy') {
//             when {
//                 equals expected: true, actual: params.destroy
//             }
        
//         steps {
//            sh "terraform destroy --auto-approve"
//         }
//     }

//   }
// }











