# Container image that runs your code

FROM alpine:3
ARG GH_VERSION=1.12.1

RUN apk update && apk add git jq && apk add bash

RUN echo https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_amd64.tar.gz
ADD https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_amd64.tar.gz ./

RUN tar xvzf gh_1.12.1_linux_amd64.tar.gz \
    && ln -s /gh_1.12.1_linux_amd64/bin/gh /usr/sbin/gh 

WORKDIR /github/workspace

COPY entrypoint.sh /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]