FROM java:8
MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
    && echo 'Asia/Shanghai' > /etc/timezone \
    && cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

ENV JAVA_OPTS "-Xms128M -Xmx256M"
ENV BOOT_ARGS ""

VOLUME /webapps
VOLUME /var/log
WORKDIR /webapps
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

