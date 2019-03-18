node('maven'){
    
    def maven360home = tool name: 'maven360', type: 'maven'
    
    stage('checkout'){
        git branch: 'batch2', credentialsId: 'lokeshgithub', url: 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    
    
    stage('Running Tests'){
        sh "$maven360home/bin/mvn clean test surefire-report:report-only"
        junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site', reportFiles: 'surefire-report.html', reportName: 'SureFireReportHTML', reportTitles: ''])
    }
    
    stage('Building'){
        sh "$maven360home/bin/mvn clean package -DskipTests=true"
    }
  
    stage('Archive Artifacts'){
        archiveArtifacts '**/target/*.jar'
    }
    
    stage('Deployment'){
        sshagent(['deployusr-target']) {
            sh "ssh -o StrictHostKeyChecking=no deployusr@172.31.34.148 /opt/tomcat/stop.sh"
            //sh "scp -o StrictHostKeyChecking=no target/my-app-1-RELEASE.jar	deployusr@172.31.34.148:/opt/tomcat/webapp/"
            sh "scp -o StrictHostKeyChecking=no index.html deployusr@172.31.34.148:/opt/tomcat/html/"
            sh "ssh -o StrictHostKeyChecking=no deployusr@172.31.34.148 /opt/tomcat/start.sh"
        }
    }
}
