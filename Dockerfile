FROM jenkins/inbound-agent:alpine as jnlp

FROM golang:alpine

RUN apk -U add openjdk8-jre git docker docker-compose

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
