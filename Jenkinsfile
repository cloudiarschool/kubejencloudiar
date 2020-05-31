pipeline {
    agent any 
    environment {
        DOCKER_TAG = getDockerTag()
    }
    stages {
        stage ('Build Docker image') {
            steps {
                sh "docker build . -t cloudiardocker/nodeapp:${DOCKER_TAG}"
            }
        }
        stage('Dockerhub Push') {
            steps {
            withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                sh "docker login -u cloudiardocker -p ${dockerHubPwd}"
                sh "docker push cloudiardocker/nodeapp:${DOCKER_TAG}"
            }
           }
        }
        stage('Deploy to K8S') {
            steps {
                sh "chmod +x changeTag.sh"
                sh "./changeTag.sh ${DOCKER_TAG}"
                sshagent(['kops-machine']) {
                sh "scp -o StrictHostKeyChecking=no services.yml node-app-pod.yml ec2-user@54.160.120.100:/home/ec2-user/"
                script {
                    try {
                        sh "ssh ec2-user@54.160.120.100 kubectl apply -f ."
                    }catch(error) {
                        sh "ssh ec2-user@54.160.120.100 kubectl create -f ."
                    }
                }
            }
            }
        }
    }
}

def getDockerTag() {
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true 
    return tag
}