FROM openjdk:9-oraclelinux8
MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"

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

