FROM ubuntu:latest

COPY sources.list /etc/apt/sources.list

RUN set -x\
&&apt-get update\
&&echo "mysql-server mysql-server/root_password password root" |debconf-set-selections\
&&echo "mysql-server mysql-server/root_password_again password root" |debconf-set-selections\
&&apt-get -y --no-install-recommends install mysql-server\
&&rm -rf /var/lib/apt/lists/*\
&&service mysql start\
&&printf "n\nn\ny\nn\ny\ny\n"|mysql_secure_installation -proot\
&&sed -i -e 's/^bind-address/#&/g' /etc/mysql/mysql.conf.d/mysqld.cnf\
&&echo "\
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"|mysql -proot\
&&service mysql stop\
&&echo "">/var/log/mysql/error.log

COPY change_passwd_and_run.sh /usr/local/bin


ENTRYPOINT ["change_passwd_and_run.sh"]

EXPOSE 3306
