node('agent1'){
    stage('checkout'){
        git credentialsId: 'gitaccess', url: 'https://github.com/lokeshkamalay/java-tomcat-maven-example.git'
    }
    stage('Build'){ //Creating the package, makesure you add mvn to path variables in agent
        sh 'mvn clean package'
    }
    stage('Deploy'){ //deploying locally
        sh 'mvn install -DskipTests=false'
    }
}
