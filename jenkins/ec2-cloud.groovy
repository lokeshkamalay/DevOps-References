node('ec2cloud-maven'){ //the label coming from aws ec2 cloud
    stage('checkout'){
        git 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    stage('Build'){
        sh "mvn clean package"
    }
    stage('awscli'){  //installing awscli in rhel machine; this stage can be skipped if you have chosen amazon linux or your ami has aws configured already.
        sh '''
        curl -O https://bootstrap.pypa.io/get-pip.py
        sudo python get-pip.py
        sudo pip install awscli
        aws --version
        '''
    }
    timeout(time: 5, unit: 'SECONDS'){  //Timeout, in case no one takes action within stipulated time, the job will fail.
        input message: 'Do Want To Deploy?', ok: 'Deploy'  //Halts the build until further action
    }
    stage('Copy to S3'){
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-ec2-batch2-creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            //withCredentials class, exports access and secret key into shell environment
            sh '''  //when you want to execute multiple related shell commands, you need to run them in a block.
                aws s3 cp target/*.jar s3://lokeshkamalay/
                
                if [[ $? -eq 0 ]]; then
                    echo "The file is copied successfully" > result.txt
                else
                    echo "The file is failed to copy" > result.txt
                fi
            '''
        }
    }
    stage('Email'){
        //emails the job details and the status.
        sh '''
            printenv
            mutt -s "Jenkins Job Status - $JOB_URL" lokesh.mydilse@gmail.com < result.txt
        '''
    }
}
