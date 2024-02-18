pipeline {
    agent any
    tools {
        maven 'maven_3_9_6'
    }
    stages{
        stage('build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Reach-VJ/devops-automation']])
                sh 'mvn clean install'
            }
        }
        stage('build docker image') {
            steps {
                script {
                    sh 'docker build -t bachi305/devops-integration .'
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u bachi305 -p ${dockerhubpwd}'

                    sh 'docker push bachi305/devops-integration'
                    }
                }
            }
        }
    }
}