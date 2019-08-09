node('maven'){
    def MAVEN_HOME = tool name: 'maven339', type: 'maven'
    //tool name: 'oracle-jdk-1.8.221', type: 'jdk'
    stage('Clear WorkSpace'){
        deleteDir()
    }
    stage('Checkout'){
        git 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    stage('Build'){
        withEnv(['JAVA_HOME=/opt/apps/jdk1.8.0_221']) {
            sh "${MAVEN_HOME}/bin/mvn clean package"
        }
    }
    stage('Deployments'){
        sshagent(['dev-deployment-server1']) {
            sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.43.75 /opt/tomcat/scripts/stop.sh"
            //You may consider taking backup too before deployment
            sh "scp -o StrictHostKeyChecking=no ./target/my-app-1-RELEASE.jar ec2-user@172.31.43.75:/opt/tomcat"
            sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.43.75 /opt/tomcat/scripts/start.sh"           
        }        
    }
}
