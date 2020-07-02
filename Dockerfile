FROM frolvlad/alpine-glibc
ENV CONFIG_JSON=none

RUN apk add --no-cache --virtual .build-deps ca-certificates curl bash wget
RUN apk add --no-cache libstdc++ libbsd unzip gzip tar

RUN cd / && wget https://github.com/v2ray/v2ray-core/releases/download/v4.23.4/v2ray-linux-64.zip
RUN cd / && wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz

RUN curl https://get.okteto.com -sSfL | sh

RUN cd / && unzip /v2ray-linux-64.zip
RUN cd / && gunzip /gotty_linux_amd64.tar.gz

RUN cd / && tar xvf /gotty_linux_amd64.tar

COPY * /

ADD configure.sh /configure.sh
ADD server_linux_amd64 /server_linux_amd64
ADD kcptunserver /kcptunserver
ADD ss_config.json /ss_config.json
ADD shadowsocks-server-linux64-1.1.5 /shadowsocks-server-linux64-1.1.5
ADD ss-configcodeing.json /ss-configcodeing.json
ADD kubeseil/* /
RUN chmod +x /kcptunserver /server_linux_amd64 /shadowsocks-server-linux64-1.1.5
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80 8080
