FROM extvos/java:10
MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV JAVA_OPTS "-Xms128M -Xmx256M"
ENV BOOT_ARGS ""

VOLUME /webapps
VOLUME /var/log
WORKDIR /webapps
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

