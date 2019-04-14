FROM openjdk
LABEL owner="loki"
LABEL desc="testingmavenbuild"
ARG version="3.6.1"
RUN curl https://www-us.apache.org/dist/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz -o apache.tar.gz && \
    mkdir /usr/share/maven && \
    tar -zxf apache.tar.gz -C /usr/share/maven --strip-components=1 && \
    chmod 0755 -R /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    rm -rf apache.tar.gz

cmd ["mvn","--version"]
