FROM ubuntu:latest

COPY sources.list /etc/apt/sources.list

RUN set -x\
&&apt-get update\
&&apt-get -y --no-install-recommends install nginx\
&&rm -rf /var/lib/apt/lists/*

COPY default /etc/nginx/sites-available/default


ENTRYPOINT ["nginx","-g","daemon off;"]

EXPOSE 80
