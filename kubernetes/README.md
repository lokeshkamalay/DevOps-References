# Small example for Implementing CICD pipeline using minikube and jenkins.
## Following are used in this example
- minikube
- helm
- Opensource Jenkins
- Docker
- A Sample maven project

## Set up Minikube, VirtualBox and Kubectl
`Sourced: https://itnext.io/deploy-jenkins-with-dynamic-slaves-in-minikube-8aef5404e9c1`
1. Setup the [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
2. Start the minikube (it may take a while)<br/>
    `minikube start --vm-driver=virtualbox`
3. Check the status of the minikube and notedown the IP
    `minikube status`
## Install the helm
1. Follow the instructions here to install the [helm](https://docs.helm.sh/using_helm/#installing-helm)
2. Initialize the helm, this will configure the tiller in kube-system namespace.<br/>
    `helm init --service-account default`

## Jenkins Setup
1. We would be using a separete namespace for Jenkins.  Create namespace by running below command.<br/>
    `kubectl create -f jenkins-namespace.yml`
2. Lets create a persistence volume for Jenkins Home.<br/>
    `kubectl create -f jenkins-volume.yml -n jenkins-project`
3. Install the Jenkins <br/>
    `helm install --name jenkins -f helm-values.yaml stable/jenkins -n jenkins-project`
4. Above command will also provides the commands to get the default password for admin account to access your Jenkins.<br/>
    `printf $(kubectl get secret --namespace jenkins-project jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo`
5. Execute the following command to get the minikube IP address to access the jenkins `http://<ip>:32000/`<br/>  (Note: Change the port number in case you modifed the values for nodePort) <br/>
    `minikube ip`
6. Login to Jenkins and install the plugin `pipeline utilities` in Jenkins. (you may update the helm-values.yml under install plugin section to avoid this step)

## Creating Credentials
1. We would be using a dedicated service account to perform all the deployments in jenkins-project namespace. Run the command to create Service Account. <br/>
    `kubectl create -f deployer.yml`
2. Generate the token of deployer account by running below commands.  Copy the output. <br/>
    `TOKENNAME=$(kubectl get secrets -n jenkins-project | grep -i deployer | awk '{print $1}')` <br/>
    `kubectl get secrets $TOKENNAME -o jsonpath='{.data.token}' -n jenkins-project | base64 --decode`
3. Login to Jenkins to create credentials with kind Secret Text.
    - Created with the name of `deployer-token`
4. Create another credentials for your docker registry.  I used dockerhub.
    - Created with the name of `lokidockerid`

## Deploy an application first
1. Since this example talks about CICD, we are launching the application in advance. <br/>
    `kubectl create -f sq.yml -n jenkins-project`

## Create a pipeline job with following instructions.
1. Click on the New Item --> Pipeline
2. Under Pipeline Section --> Pipeline script from SCM
3. Choose Git,
4. Repository URL --> https://github.com/lokeshkamalay/java-tomcat-maven-example.git
5. Script Path --> [Jenkinsfile-k8s](https://github.com/lokeshkamalay/java-tomcat-maven-example/blob/master/Jenkinsfile-k8s)

## Running the Job.
1. Execute the job first and it may fail due to unapproval of a method to get artifacts method.
2. Go to Manage Jenkins --> In-process Script  Approval --> approve the method.
3. Now run the job again.

## Job Execution steps.
1. It is going to pull two images, maven and java with docker client.
2. Exposed docker socket into java with docker client image to work on docker
3. Build stage generate the package under taget directory
4. Preparing Image stage, prepares your new image using [Dockerfile](https://github.com/lokeshkamalay/java-tomcat-maven-example/blob/master/Dockerfile) and publishes it to registry.
5. Deployment Stage, downloads kubectl, configures and updates the deployment that we created above by sq.yml file


