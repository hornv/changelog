# Container image that runs your code

FROM alpine

RUN apk add git jq

ADD https://github.com/cli/cli/releases/download/v1.12.1/gh_1.12.1_linux_amd64.tar.gz ./
RUN tar xvzf gh_1.12.1_linux_amd64.tar.gz \
    && ln -s /gh_1.12.1_linux_amd64/bin/gh /usr/sbin/gh \
    && mkdir -p /github/workspace

VOLUME [/github/workspace]
WORKDIR /github/workspace

#FROM ubuntu:latest

#RUN apt-get update && apt-get install git jq -y
#ADD https://github.com/cli/cli/releases/download/v1.12.1/gh_1.12.1_linux_amd64.deb ./
#RUN dpkg -i gh_1.12.1_linux_amd64.deb


COPY entrypoint.sh /entrypoint.sh

# WORKDIR /github/workspace
# Code file to execute when the docker container starts up (`entrypoint.sh`)

ENTRYPOINT ["/entrypoint.sh"]