# Use official Tomcat 8.5 image with Java 11
FROM tomcat:8.5-jdk11

# Remove default apps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to ROOT app slot
COPY ./webapps/ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Disable shutdown port by editing server.xml before start
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Optional: keep shutdown port disabled via environment variable
ENV CATALINA_OPTS="-Dtomcat.shutdown.port=-1"

# Expose HTTP port
EXPOSE 8080

# Start Tomcat in foreground (required for Docker)
CMD ["catalina.sh", "run"]
