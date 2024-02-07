properties([disableConcurrentBuilds()])
//if (env.BRANCH_NAME == "master") {
//    properties([
//        pipelineTriggers([
//            pollSCM("* * * * *")
//        ])
//    ])
//}
pipeline {
    agent {
        label 'master'
    }
//    triggers { pollSCM('* * * * *') }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        timestamps()
    }
    tools {nodejs "nodejs-21.3.0"}
    environment {
        CI = 'true'
        NAME = "vue-project"
        VERSION = "${env.BUILD_ID}"  // -${env.GIT_COMMIT}
        IMAGE = "${NAME}-${VERSION}.tgz"
    }
    stages {
//        stage('Create') {
//            steps {
//                sh 'npm create vite@latest my-vue-app -- --template vue-ts'
//            }
//        }
//        stage('Build123') {
//            steps {
//                checkout scm
//                sh 'npm install'
//            }
//        }
        stage('Example') {
            steps {
                 echo "Running ${env.BUILD_ID} on ${env.VERSION}"
            }
        }
        stage('Build') {
            steps {
                checkout scm
                sh './jenkins/scripts/build.sh'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
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
        
        stage("Docker login") {
            when {
                branch 'main'  
            }       
            steps {
                echo " ============== docker login =================="
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    docker login -u $USERNAME -p $PASSWORD
                    """
                }
            }
        }
        stage("Create docker image") {
            when {
                branch 'main'  
            }
            steps {
                echo " ============== start building image =================="
                dir ('./') {
                    sh 'docker build -t vasilvedev/vue-project:latest . '
                }
            }
        }
/*        
        stage("Docker push") {
            when {
                branch 'main' 
            }
            steps {
                echo " ============== start pushing image =================="
                sh '''
                docker push vasilvedev/vue-project:latest
                '''
            }
        }
*/        
        stage('Deploy for production') {
            when {
                branch 'main'  
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('NPM hosted') {
            environment {
               VERSION = sh(script: "grep \"version\" package.json | cut -d '\"' -f4 | tr -d '[[:space:]]'", returnStdout: true)
            }
//            when {
//                branch 'main'  
//            }
            steps {
//            echo sh(script: "grep \"version\" package.json | cut -d '\"' -f4 | tr -d '[[:space:]]'", returnStdout: true)
            sh "/bin/bash ./jenkins/scripts/npm-hosted.sh $VERSION"
//                sh './jenkins/scripts/npm-hosted.sh'
//                input message: 'Finished using the web site? (Click "Proceed" to continue)'
            }
        }
        stage ('local-ssh'){
        	sshagent(['ssh_local1']) {
    			echo "============== start localhost =============="
    			sh '''
    			uname -a
    			docker login -u vasilvedev -p jsdcCoWq00VvkF9AuL0V
    			docker pull vasilvedev/vue-project:latest
    			'''
		}
    	}
}
}
