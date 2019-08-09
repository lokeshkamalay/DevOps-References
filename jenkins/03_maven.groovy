node('maven'){
    def MAVEN_HOME = tool name: 'maven339', type: 'maven'
    //tool name: 'oracle-jdk-1.8.221', type: 'jdk'
    stage('Checkout'){
        git 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    stage('Build'){
        withEnv(['JAVA_HOME=/opt/apps/jdk1.8.0_221']) {
            sh "${MAVEN_HOME}/bin/mvn clean install"
        }
    }
}
