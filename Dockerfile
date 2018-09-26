FROM maven
ADD . /application
WORKDIR /application
RUN mvn clean install

FROM tomcat:alpine
COPY --from=0 /application/target/SpringMVCSecurityXML.war /usr/local/tomcat/webapps
