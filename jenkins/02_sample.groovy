node(){
    stage('checkout'){
        git branch: 'develop', credentialsId: 'lokigithubapikey', url: 'https://github.com/sanquestbatch3/bashscripts.git'
    }
    stage('Build'){
        sh "sh diamond.sh"
    }
}
