# Docker-python_mysql
## Description
Simple example of two container communicating together using python and mysql.

Container 'database' run the database with Mysql and the second container 'core' run a python code connecting to the database.

## Utilisation

Simply execute 'run.sh' script.

$ sh ./run.sh

## Hints
### Mysql trick

The following line:

$ sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

allow mysql server to listen on every ip.

### Mysql user

The following line:

$ echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql

create a new user with full privileges.