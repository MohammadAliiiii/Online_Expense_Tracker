# Use official Tomcat base image with Java
FROM tomcat:8.5.99-jdk8

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR into Tomcat’s webapps directory
COPY ./webapps/ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the web port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

# Disable shutdown port for Tomcat
ENV CATALINA_OPTS="-Dtomcat.shutdown.port=-1"