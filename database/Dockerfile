FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

RUN apt-get -y install mysql-client mysql-server

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD ./startup.sh /opt/startup.sh

EXPOSE 3316

CMD ["/bin/bash", "/opt/startup.sh"]

# docker build -t mysql .
# docker run -d --name database -p 3308:3306 -v /data/mysql:/var/lib/mysql mysql