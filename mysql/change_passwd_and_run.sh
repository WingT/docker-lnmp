#!/bin/sh
if [ -z "$MYSQL_ROOT_PASSWORD" ]
then 
	echo "MYSQL_ROOT_PASSWORD must be set!"
else
	set -x
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
	service mysql start
	mysql -proot<<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY  '$MYSQL_ROOT_PASSWORD';
ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF
	echo "mysql root password changed!"
	service mysql stop
	mysqld
fi
