# Use official Tomcat base image with Java
FROM tomcat:9-jdk11

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR into Tomcat’s webapps directory
COPY ./webapps/ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the web port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
