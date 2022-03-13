# docker run -it -d --name lxdui --restart=always -p 15151:15151 -v /var/snap/lxd/common/lxd/unix.socket:/var/snap/lxd/common/lxd/unix.socket armv8a/lxdui
# Change admin password:
# docker exec -it lxdui /bin/bash
# python3 ./run.py user update -u admin

FROM ubuntu:20.04

ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh:en_US:en LC_ALL=zh_CN.UTF-8 DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y ;  apt install -y python3

ADD . /app
WORKDIR /app

RUN apt install -y python3-pip locales locales-all tzdata;\
    locale-gen zh_CN.UTF-8;\
    cp -rfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;\
    pip3 install setuptools;\
    pip3 install itsdangerous==2.0.1;\
    python3 setup.py install

ENTRYPOINT ["python3", "run.py", "start"]
