pipeline{
    agent none
    environment { 
        WHEREAMI = "in Global Environment"
    }
    stages {
        stage('Maven - 1'){
            agent {
                docker {
                    image 'maven:latest'
                    label 'docker' 
                }
            }
            environment {
                WHEREAMI = "In First stage"
            }
            steps {
                sh "mvn --version"
                sh "echo $WHEREAMI"
            }
        }

        stage('Maven - 2'){
            agent {
                docker {
                    image 'maven:3-jdk-8-alpine'
                    label 'docker'
                }
            }
            environment {
                WHEREAMI = "In Second Stage"
            }
            steps {
                sh "mvn --version"
                sh "echo $WHEREAMI"
            }
        }
    }
    post {
        always {
            echo "I m in post $WHEREAMI"
        }
        failure {
            echo "I failed"
        }
        success {
            echo "mail me"
        }
    }
}
