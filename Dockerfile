FROM qnib/alpn-jdk8

RUN mkdir -p /opt/jenkins/lib \
 && cd /opt/jenkins/lib \
 &&  wget -q http://mirrors.jenkins-ci.org/war/2.6/jenkins.war
