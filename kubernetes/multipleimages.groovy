def label = "maven339-latest-${UUID.randomUUID().toString()}"

podTemplate(label: 'mymaven', yaml: """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: maven339
    image: maven:3.3.9-jdk-8-alpine
    command: ['cat']
    tty: true
  - name: mavenlatest
    image: maven:latest
    command: ['cat']
    tty: true
"""
  ) {

  node('mymaven') {
    stage('maven339') {
      container('maven339') {
        sh 'mvn --version'
      }
    }

    stage('Maven Latest') {
      container('mavenlatest') {
        sh 'mvn --version'
      }
    }

  }
}
