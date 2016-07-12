FROM qnib/alpn-jdk8

ENV JENKINS_HOME=/home/jenkins/ \
    JENKINS_VER=2.13
RUN mkdir -p /opt/jenkins/lib ${JENKINS_HOME}/plugins/ \
 && cd /opt/jenkins/lib \
 &&  wget -q http://mirrors.jenkins-ci.org/war/${JENKINS_VER}/jenkins.war
RUN cd ${JENKINS_HOME}/plugins/ \
 && wget -q http://updates.jenkins-ci.org/latest/github-api.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/github-branch-source.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/github-pullrequest.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/github.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/graphiteIntegrator.hpi
