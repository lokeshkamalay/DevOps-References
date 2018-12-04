def label = "maven-${UUID.randomUUID().toString()}"

podTemplate(label: 'mymaven', containers: [
  containerTemplate(name: 'maven339', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat')
  ]) {

  node('mymaven') {
    stage('Checkout') {
      git 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    stage('Build'){  
      container('maven339') {
          sh 'mvn clean package'
      }
    }
  }
}
