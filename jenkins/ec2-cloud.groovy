node('ec2cloud-maven'){
    stage('checkout'){
        git 'https://github.com/lokeshkamalay/simple-java-maven-app.git'
    }
    stage('Build'){
        sh "mvn clean package"
    }
    stage('awscli'){
        sh '''
        curl -O https://bootstrap.pypa.io/get-pip.py
        sudo python get-pip.py
        sudo pip install awscli
        aws --version
        '''
    }
    stage('Copy to S3'){
        sh "aws s3 cp target/*.jar s3://lokeshkamalay/"
    }
}
