pipeline {
    agent any
    environment {
        imageName = "hello-nginx"
    }
    stages {
        stage("Prepare"){
            steps {
                echo "Hello World"
            }     
        }
        stage("check version"){
            steps {
                sh "docker --version"
            }        
        }
        stage("build image"){
            steps {
                sh "docker build -t ${env.imageName} ."
                sh "docker tag ${env.imageName} ${env.imageName}:1.${env.BUILD_NUMBER}"
            }
        }
        /*stage("push Images"){
            steps {
                sh "docker login -u xxx -p xxx"
                sh "docker push ${env.imageName}"
            }
        }*/
        /*stage("push image docker hub"){
            script{
                docker.withReistry('https://registry.hub.docker.com', 'docker-id'){
                    def image = docker.build ("${env.imageName}:1.${env.BUILD_NUMBER}")
                    image.push()
                }
            }
        }*/
        stage("deploy"){
            steps {
                sshagent(['core-server']){
                    sh "docker pull hello-world"
                    //sh "core@167.99.237.229 docker pull hello-world"
                }
            }
        }
    }
}