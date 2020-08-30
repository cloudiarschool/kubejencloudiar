pipeline {
    agent any 
    environment {
        DOCKER_TAG = getDockerTag()
        
    }
    stages {
        stage('Build Docker image') {
            steps {
                sh "docker build . -t cloudiardocker/nodeapp:${DOCKER_TAG}"
            }
        }
        stage('Dockerhub Push') {
            steps{
                    docker.withRegistry('https://registry.hub.docker.com','dockerhub'){
                    sh "docker push cloudiardocker/nodeapp:${DOCKER_TAG}"
                    }
                
            }
            
        }
            
    }
   }

def getDockerTag() {
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag 
}