pipeline {
    agent any 
    environment {
        DOCKER_TAG = getDockerTag()
        PASSWORD = credentials('docker-hub')
    }
    stages {
        stage('Build Docker image') {
            steps {
                sh "docker build . -t cloudiardocker/nodeapp:${DOCKER_TAG}"
            }
        }
        stage('Dockerhub Push') {
            steps{
                    sh "docker login -u cloudiardocker -p ${PASSWORD}"
                    sh "docker push cloudiardocker/nodeapp:${DOCKER_TAG}"
                
            }
            
        }
            
    }
   }

def getDockerTag() {
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag 
}