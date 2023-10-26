//this pipeline is use to run the roboshop catalogue component this is the CD  process, once the CI process is run 
//successfully then this CD to run automatically 

pipeline {
    agent { node { label 'AGENT-1' } }
    options {
        ansiColor('xterm')
    }
    parameters {
        string(name: 'version', defaultValue: '1.0.1', description: 'Which version to Deploy')
        string(name: 'environment', defaultValue: 'dev', description: 'Which env to Deploy')
    }
    stages {
        stage('Deploy'){
            steps{
                echo "Deploying..."
                echo "Version from params: ${params.version}"

            }
        }
        stage('Init'){
            steps{
                sh """
                cd terraform
                terraform init -backend-config=../dev/backend.tf -reconfigure
                """
            }
        }
        stage('Plan'){
            steps{
                sh """
                cd terraform
                terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -var="env=${params.environment}"
                """
            }
        }

        stage('Approve stage') {

            input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                }
            }
            steps {
                echo "Hello, ${PERSON}, nice to meet you."
            }
        }

        stage('Apply'){
            steps{
                sh """
                cd terraform
                terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -var="env=${params.environment}" -auto-approve
                """
            }
        }
    }


    post{
        always{
            echo 'cleaning up workspace'
            //deleteDir()
        }
    }
}