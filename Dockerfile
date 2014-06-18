FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get install -y curl
  
RUN \
  curl http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - && \
  echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list && \
  apt-get update && \
  apt-get install -y jenkins

RUN \
  mkdir -p /var/run/jenkins && \
  mkdir -p /var/lib/jenkins && \
  chown jenkins /var/lib/jenkins

EXPOSE 8080

VOLUME ["/var/log/jenkins","/var/lib/jenkins"]

CMD exec su jenkins -c "java -jar /usr/share/jenkins/jenkins.war"
