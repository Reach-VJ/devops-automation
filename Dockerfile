# JDK_Version

FROM openjdk:21-slim

EXPOSE 8080

ADD target/devops-integration.jar devops-integration.jar

#Starting point to run jar file : java -jar app.jar
ENTRYPOINT ["java", "-jar", "/devops-integration.jar"]