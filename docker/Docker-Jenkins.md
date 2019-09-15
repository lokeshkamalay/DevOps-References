# Docker and Jenkins
Performing Jenkins Builds inside images

## Setup
### Docker Setup
- Launch an ubuntu machine
- Follow the [Instructions](https://docs.docker.com/install/linux/docker-ce/ubuntu/) to setup docker


### Jenkins Setup
- Install the openjdk `sudo apt install openjdk-8-jdk`
- Execute the commands below one after one
  1. wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
  2. sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  3. sudo apt-get update
  4. sudo apt-get install jenkins

### Give Jenkins Access to Docker
- sudo usermod -a -G docker jenkins

## Prepare a Maven Agent
- Create a Dockerfile with below contents
  ```
  FROM openjdk
  LABEL owner="loki"
  LABEL desc="testingmavenbuild"
  ARG version="3.6.1"
  # Installing Maven here
  RUN curl https://www-us.apache.org/dist/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz -o apache.tar.gz && \
      mkdir /usr/share/maven && \
      tar -zxf apache.tar.gz -C /usr/share/maven --strip-components=1 && \
      chmod 0755 -R /usr/share/maven && \
      ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
      rm -rf apache.tar.gz

  CMD ["mvn","--version"]
  ```
- Build the docker image `docker build -t <repo>/maven:dockertest .` *#Pls replace `<repo>` with your repo name or login.*
- Push the docker image to repo
  ```
  docker login #login with your dockerhub credentials
  docker push <repo>/maven:dockertest #change repo name here too
  ```
## Running Job
- Start the service `sudo service jenkins start` *#In case you have started the service before granting Jenkins access to docker, then you need to restart the service*
- Create a pipeline job with following script
  ```
  pipeline {
    agent {
        docker {
            image '<repo>/maven:dockertest' //pls change the <repo> with your repoin GitHub
        }
    }
    stages {
        stage('Checkout'){
            steps{
                git 'https://github.com/lokeshkamalay/tomcat_maven_app.git'
            }
        }
        stage('Build'){
            steps{
                sh "mvn clean install"
            }
        }
    }
  }
  ```
- Console Output
    <details>
    <summary>Pls click here</summary>
    Started by user loki
    Started by user loki
    Running in Durability level: MAX_SURVIVABILITY
    [Pipeline] Start of Pipeline
    [Pipeline] node
    Running on Jenkins in /var/lib/jenkins/workspace/docker
    [Pipeline] {
    [Pipeline] sh
    + docker inspect -f . lokeshkamalay/maven:dockertest
    .
    [Pipeline] withDockerContainer
    Jenkins does not seem to be running inside a container
    $ docker run -t -d -u 111:115 -w /var/lib/jenkins/workspace/docker -v /var/lib/jenkins/workspace/docker:/var/lib/jenkins/workspace/docker:rw,z -v /var/lib/jenkins/workspace/docker@tmp:/var/lib/jenkins/workspace/docker@tmp:rw,z -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** lokeshkamalay/maven:batch3 cat
    $ docker top 3cc09b8a62538b1023515f0bb4062fa3318c0db5803ac0dd2d381a81bca16046 -eo pid,comm
    [Pipeline] {
    [Pipeline] stage
    [Pipeline] { (Checkout)
    [Pipeline] git
    No credentials specified
    Cloning the remote Git repository
    Cloning repository https://github.com/lokeshkamalay/tomcat_maven_app.git
    > git init /var/lib/jenkins/workspace/docker # timeout=10
    Fetching upstream changes from https://github.com/lokeshkamalay/tomcat_maven_app.git
    > git --version # timeout=10
    > git fetch --tags --progress -- https://github.com/lokeshkamalay/tomcat_maven_app.git +refs/heads/*:refs/remotes/origin/*
    > git config remote.origin.url https://github.com/lokeshkamalay/tomcat_maven_app.git # timeout=10
    > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
    > git config remote.origin.url https://github.com/lokeshkamalay/tomcat_maven_app.git # timeout=10
    Fetching upstream changes from https://github.com/lokeshkamalay/tomcat_maven_app.git
    > git fetch --tags --progress -- https://github.com/lokeshkamalay/tomcat_maven_app.git +refs/heads/*:refs/remotes/origin/*
    > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
    > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
    Checking out Revision 8a6ac0df1724a79d82f21b2440dfcd63a0692699 (refs/remotes/origin/master)
    > git config core.sparsecheckout # timeout=10
    > git checkout -f 8a6ac0df1724a79d82f21b2440dfcd63a0692699
    > git branch -a -v --no-abbrev # timeout=10
    > git checkout -b master 8a6ac0df1724a79d82f21b2440dfcd63a0692699
    Commit message: "Delete ConsoleOutput.png"
    First time build. Skipping changelog.
    [Pipeline] }
    [Pipeline] // stage
    [Pipeline] stage
    [Pipeline] { (Build)
    [Pipeline] sh
    + mvn clean install
    [INFO] Scanning for projects...
    [INFO] 
    [INFO] ---------------< com.example:java-tomcat-maven-example >----------------
    [INFO] Building hello Maven Webapp 1.0-SNAPSHOT
    [INFO] --------------------------------[ war ]---------------------------------
    Downloading from central: https://repo.maven.apache.org/maven2/org/apache/maven/plugins/maven-clean-plugin/2.5/maven-clean-plugin-2.5.pom
    Progress (1): 2.2/3.9 kB
    Progress (1): 3.9 kB    
    <br/>                    
    ...<br/>
    ...<br/>
    [INFO] Installing /var/lib/jenkins/workspace/docker/target/java-tomcat-maven-example.war <br/> to /var/lib/jenkins/workspace/docker/?<br/> /.m2/repository/com/example/java-tomcat-maven-example/1.<br/> 0-SNAPSHOT/java-tomcat-maven-example-1.0-SNAPSHOT.war<br/> 
    [INFO] Installing /var/lib/jenkins/workspace/docker/pom.xml to <br/> /var/lib/jenkins/workspace/docker/?<br/> /.m2/repository/com/example/java-tomcat-maven-example/1.<br/> 0-SNAPSHOT/java-tomcat-maven-example-1.0-SNAPSHOT.pom<br/>
    [INFO] ------------------------------------------------------------------------<br/>
    [INFO] BUILD SUCCESS<br/>
    [INFO] ------------------------------------------------------------------------<br/>
    [INFO] Total time:  12.433 s<br/>
    [INFO] Finished at: 2019-09-15T14:12:54Z<br/>
    [INFO] ------------------------------------------------------------------------<br/>
    [Pipeline] }<br/>
    [Pipeline] // stage<br/>
    [Pipeline] }<br/>
    $ docker stop --time=1 <br/> 3cc09b8a62538b1023515f0bb4062fa3318c0db5803ac0dd2d381a81bca16046<br/>
    $ docker rm -f 3cc09b8a62538b1023515f0bb4062fa3318c0db5803ac0dd2d381a81bca16046<br/>
    [Pipeline] // withDockerContainer<br/>
    [Pipeline] }<br/>
    [Pipeline] // node<br/>
    [Pipeline] End of Pipeline<br/>
    Finished: SUCCESS<br/>
    </details>

## Notes
- You may use Dockerfile directly in the pipeline
- You may use multiple Images to build the job however the workspace is not shared (This is possible with Kubernetes as a cloud)
- [Docker Jenkins pipeline](https://jenkins.io/doc/book/pipeline/docker/)

