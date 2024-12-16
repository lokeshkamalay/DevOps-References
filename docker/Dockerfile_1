FROM openjdk
LABEL owner="neha"
LABEL desc="testingmavenbuild"
ARG version="3.8.1"
# Installing Maven here
RUN curl https://apachemirror.wuchna.com/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz -o apache-maven-3.8.1-bin.tar.gz && \
    mkdir /usr/share/maven && \
    tar -zxvf apache-maven-3.8.1-bin.tar.gz -C /usr/share/maven --strip-components=1 && \
    chmod 0755 -R /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    rm -rf apache-maven-3.8.1-bin.tar.gz

CMD ["mvn","--version"]
