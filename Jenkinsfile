//this pipeline is use to run the roboshop catalogue component this is the CD  process, once the CI process is run 
//successfully then this CD to run automatically 

pipeline {
    agent { node { label 'AGENT-1' } }
    environment{

        packageVersion = ''
    }
    stages {
        stage('Deploy') {
            steps {
                echo "Deploying for now"

            }
        }



    }
    
    post { 
        always { 
            echo 'cleaning the workspace'
            deleteDir()
        }
    }
}
