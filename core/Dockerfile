FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

RUN apt-get install -y python-pip
RUN apt-get install -y python-dev libmysqlclient-dev
RUN pip install MySQL-python

RUN apt-get -y install mysql-client mysql-server

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD ./startup.sh /opt/startup.sh

ADD ./db_connection.py /tmp/db_connection.py
RUN chmod +x /tmp/db_connection.py

ADD ./run-client.sh /tmp/run-client.sh
RUN chmod +x /tmp/run-client.sh

EXPOSE 3306

CMD ["/bin/bash", "/opt/startup.sh"]

# docker build -t tm/core .
# docker run -d --name core tm/core