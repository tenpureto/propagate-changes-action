FROM alpine/git:latest

RUN apk add --no-cache bash curl jq

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing hub

ENV TENPURETO_VERSION=0.5.0
RUN curl -sL https://github.com/tenpureto/tenpureto/releases/download/v${TENPURETO_VERSION}/tenpureto-${TENPURETO_VERSION}-x86_64-linux -o /usr/bin/tenpureto && \
    chmod +x /usr/bin/tenpureto

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

ENV HUB_PROTOCOL=https
ENV GITHUB_USER=github-action
ENV GIT_AUTHOR_NAME=Tenpureto
ENV GIT_AUTHOR_EMAIL=github-action@tenpureto.org
ENV GIT_COMMITTER_NAME=Tenpureto
ENV GIT_COMMITTER_EMAIL=github-action@tenpureto.org

ENV PULL_REQUEST_LABEL ""

ADD *.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
