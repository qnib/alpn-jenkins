FROM qnib/alpn-jdk8


ENV JENKINS_HOME=/var/jenkins/
RUN mkdir -p /opt/jenkins/lib/ ${JENKINS_HOME}/plugins \
 && cd /opt/jenkins/lib/ \
 && wget -q http://mirrors.jenkins-ci.org/war/latest/jenkins.war
RUN cd ${JENKINS_HOME}/plugins/ \
 && wget -q http://mirrors.jenkins-ci.org/plugins/pipeline-rest-api/latest/pipeline-rest-api.hpi \
 && wget -q http://mirrors.jenkins-ci.org/war/latest/jenkins.war \
 && wget -q http://updates.jenkins-ci.org/latest/ace-editor.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/authentication-tokens.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/branch-api.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/build-metrics.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/build-pipeline-plugin.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/bulk-builder.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/chucknorris.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/cloudbees-folder.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/consul-kv-builder.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/credentials.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/dashboard-view.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/docker-build-step.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/docker-commons.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/docker-plugin.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/durable-task.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/envinject.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/ghprb.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/git-client.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/git-server.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/git-tag-message.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/git.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/github-api.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/github.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/global-build-stats.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/handlebars.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/icon-shim.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/javadoc.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/jira-trigger.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/join.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/jquery-detached.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/jquery.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/junit.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/mailer.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/matrix-project.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/mattermost.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/maven-plugin.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/momentjs.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/mqtt-notification-plugin.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/multi-branch-project-plugin.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/multiple-scms.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/notification.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/pipeline-build-step.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/pipeline-input-step.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/pipeline-stage-step.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/pipeline-stage-view.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/plain-credentials.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/promoted-builds.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/rundeck.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/scm-api.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/script-security.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/slack.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/ssh-agent.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/ssh-credentials.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/ssh-slaves.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/structs.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/token-macro.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/tracking-git.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-aggregator.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-api.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-basic-steps.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-cps-global-lib.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-cps.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-durable-task-step.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-job.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-multibranch.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-scm-step.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-step-api.hpi \
 && wget -q http://updates.jenkins-ci.org/latest/workflow-support.hpi \
ADD opt/qnib/jenkins/bin/start.sh /opt/qnib/jenkins/bin/
ADD etc/supervisord.d/jenkins.ini /etc/supervisord.d/
RUN apk add --update git
