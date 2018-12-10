pipeline{
    agent{
        kubernetes{
            label 'maventest'
            defaultContainer 'jnlp'
            yaml """
apiVersion: v1                           
kind: Pod
metadata:
  labels:
    project-name: sq      
    project-job: sqjob
spec:
  containers:
  - name: maven35
    image: maven:3.5.4-jdk-10-slim
    command:
    - cat
    tty: true
  - name: dockerclient
    image: cloudbees/java-with-docker-client
    command:
    - cat
    tty: true
    volumeMounts:
    - name: dockersocket
      mountPath: /var/run/docker.sock
  volumes:
  - name: dockersocket
    hostPath:
      path: /var/run/docker.sock
"""
        }
    }

    environment{
        NOTIFYUSERS = 'lokeshkamalay@gmail.com'
        REGISTRY = 'lokeshkamalay/sq'
        DOCKERLOGIN = credentials('lokidockerid')
        // DOCKERAUTH = credentials('lokiucpauthid')
        REPO = readMavenPom().getArtifactId()
        VERSION = readMavenPom().getVersion()
        EXTENSION = readMavenPom().getPackaging()
        // TAG = VERSION.replace("-SNAPSHOT", "-${env.BUILD_NUMBER}")
        APPNAME = 'sq'
        CNAME = 'tomcat'
        TAG = 'kubernetes'
        
    }
      
    stages{
        // stage('Checkout'){
        //     steps{
        //         container('maven35'){
        //             git 'https://github.com/lokeshkamalay/java-tomcat-maven-example.git'
        //         }
        //     }  
        // }
        stage('Build'){
            steps{
                container('maven35'){
                    sh 'mvn clean package'
                }
            }
        }
        stage('Preparing Image'){
            steps{
                container('dockerclient'){
                    sh '''
                        #Following in case you are using Docker Enterprise or private Kubernetes cluster
                        #curl -k -H "Authorization: Bearer ${DOCKERAUTH}" https://kubernetes/api/clientbundle -o bundle.zip
                        #unzip bundle.zip
                        #export DOCKER_TLS_VERIFY=1
                        #export COMPOSE_TLS_VERSION=TLSv1_2
                        #export DOCKER_CERT_PATH=$PWD
                        #export DOCKER_HOST=tcp://dockerenterprise:443
                        docker build --build-arg ARTIFACT="${REPO}.${EXTENSION}" -t ${REGISTRY}:${TAG} -f Dockerfile .
                        #docker login -u "${DOCKERLOGIN_USR}" -p "${DOCKERLOGIN_PSW}" "${REGISTRY}" #In case or private registery
                        docker login -u "${DOCKERLOGIN_USR}" -p "${DOCKERLOGIN_PSW}"
                        docker push ${REGISTRY}:${TAG}
                    '''
                }
            }
        }
        stage('Deployment'){
            steps{
                container('dockerclient'){
                      withCredentials([
                                        string(credentialsId: 'deployer-token', variable: 'TOKEN')
                                    ]) {
                        sh '''
                            curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
                            chmod a+x kubectl
                            mv ./kubectl /usr/local/bin/kubectl
                        '''                
                        sh "kubectl config set-cluster minikube "+
                            "--server=https://192.168.99.100:8443 "+
                            "--insecure-skip-tls-verify=true"
                        sh "kubectl config set-credentials deployer --token='$TOKEN'"
                        sh "kubectl config set-context minikube --user=deployer --cluster=minikube"
                        sh "kubectl config use-context minikube"
                        sh '''
                            kubectl set image deployments/"${APPNAME}" "${CNAME}"="${REGISTRY}:${TAG}"
                        '''
                                    }
                }
            }
        }
    }
}
