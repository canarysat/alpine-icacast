FROM alpine:latest
ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Peter CanarySAT <peter@canarysat.com>" \
    architecture="amd64/x86_64" \
    icecast-version="2.4.4-r1" \
    alpine-version="latest" \
    build="04-Jul-2020" \
    org.opencontainers.image.title="alpine-icecast" \
    org.opencontainers.image.description="Icecast Stream Docker image running on Alpine Linux" \
    org.opencontainers.image.authors="Peter Pezzano <peter@canarysat.com>" \
    org.opencontainers.image.vendor="CanarySAT" \
    org.opencontainers.image.version="latest" \
    org.opencontainers.image.url="https://hub.docker.com/r/canarysat/alpine-icecast" \
    org.opencontainers.image.source="https://github.com/canarysat/alpine-icecast" \
    org.opencontainers.image.revision=$VCS_REF \
    org.opencontainers.image.created=$BUILD_DATE

RUN apk update && apk add mailcap icecast && \
    rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME [ "/var/log/icecast2", "/etc/icecast2" ]

COPY config/icecast.xml /etc/icecast2/

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]

CMD icecast -c /etc/icecast2/icecast.xml
