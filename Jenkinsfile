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
            //sh 'npm install'
                sh './jenkins/scripts/build.sh'
            //sh 'npm run build'
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development' 
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'main'  
            }
            steps {
                sh 'pwd'
           //   sh 'du -a'
            //sh 'npm run dev'
   //         sh 'npm run dev -- --port 3000'
                //sh './jenkins/scripts/deliver-for-development.sh'
                sh './jenkins/scripts/deploy-for-production.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
