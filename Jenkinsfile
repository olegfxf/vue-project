properties([disableConcurrentBuilds()])
pipeline {
    agent any
    triggers { pollSCM('* * * * *') }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        timestamps()
    }
    tools {nodejs "node"}
    environment {
        CI = 'true'
    }
    stages {
        stage('Create') {
            steps {
                sh 'npm create vite@latest my-vue-app -- --template vue-ts'
            }
        }
        stage('Build') {
            steps {
                sh './jenkins/scripts/build.sh'
            }
        }
        stage('Deliver for development') {
            when {
                branch 'main' 
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage("docker login") {
            steps {
                echo " ============== docker login =================="
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    docker login -u $USERNAME -p $PASSWORD
                    """
                }
            }
        }
        stage('Deploy for production') {
            when {
                branch 'main'  
            }
            steps {
           //     sh 'pwd'
           //   sh 'du -a'
                sh './jenkins/scripts/deploy-for-production.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
