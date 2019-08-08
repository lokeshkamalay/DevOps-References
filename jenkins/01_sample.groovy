node(){
    stage('Greetings'){
        echo "Hey there!"
    }
    stage('Know Each Other'){
        echo "My Name is so and so"
        echo "I do Jenkins"
    }
    stage('Executing shell commands'){
        sh "ls -latr"
        sh "pwd"
        sh "whoami"
    }
    stage('Ending'){
        sh '''
            ls -latr
            pwd
            whoami
            systemctl status jenkins
        '''
    }
    stage('Sleeping'){
        sh "sleep 60"
    }
}
