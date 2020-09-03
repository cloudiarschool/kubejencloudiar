pipeline {
    agent any
    environment{
    DOCKER_TAG = getDockerTag()
    registryCredential = "dockerhub"
    }

stages {
    stage('Build docker image') {
        steps{
            sh "docker build . -t cloudiardocker/nodeapp:${DOCKER_TAG}"
        }
    }
    stage('Dockerhub push'){
        steps{
            script{
                docker.withRegistry('',registryCredential)
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
