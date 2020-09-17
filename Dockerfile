FROM extvos/java:latest
MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"

RUN apk update \
    && apk add --no-cache fontconfig font-util ttf-dejavu ttf-opensans \
    && fc-cache --force

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV JAVA_OPTS ""
ENV BOOT_ARGS ""

ENV JAVA_OPT_0 "-Xms128M -Xmx256M"

VOLUME /webapps
VOLUME /var/log
WORKDIR /webapps
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

