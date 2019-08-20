pipeline {
    agent {
        label 'maven'
    }
    tools {
        maven 'maven339'
        jdk 'oracle-jdk-1.8.221'
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '1'))
        timeout (time: 30, unit: 'SECONDS')
    }
    environment {
        VAR1 = "Test Variable"
    }
    stages{
        stage('Build'){
            steps{
                sh "mvn clean package"
                script{
                    stash includes: 'target/*.war', name: 'artifact'
                }
            }
        }

        stage('Print Public Key'){
            agent {
                label 'test'
            }
            input {
                message 'Do You Want me to Deploy to Prod?'
                ok 'Yes Go Ahead'
                submitter 'madhav'
            }
            steps{
                script{
                    unstash 'artifact'
                }
                sh "touch abc.txt"
            }
        }
    }
    post {
        always {
            echo "The job is successful"
            deleteDir()
        }
        failure {
            echo "Shoot an email"
        }
    }
}
