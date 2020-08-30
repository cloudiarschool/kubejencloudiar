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
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                    sh "docker login -u cloudiardocker -p Azerbaijan1$!"
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