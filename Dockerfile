FROM qnib/alpn-jdk8

ENV JENKINS_HOME=/home/jenkins/ \
    JENKINS_VER=2.13
RUN mkdir -p /opt/jenkins/lib ${JENKINS_HOME}/plugins/ \
 && cd /opt/jenkins/lib \
 &&  wget -q http://mirrors.jenkins-ci.org/war/${JENKINS_VER}/jenkins.war \
 && adduser jenkins -D -s /bin/bash \
 && echo "jenkins:$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)" |chpasswd
RUN cd ${JENKINS_HOME}/plugins/ \
 && wget -q http://updates.jenkins-ci.org/latest/github-api.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/github-branch-source.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/github-pullrequest.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/github.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/graphiteIntegrator.hpi 
RUN apk --no-cache add openssh
