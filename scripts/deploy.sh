#!/bin/bash
set -ex

source .env

# Ejecutamos las sentencias SQL
mysql -u root -e "DROP DATABASE IF EXISTS $DB_NAME"
mysql -u root -e "CREATE DATABASE $DB_NAME"

mysql -u root -e "DROP USER IF EXISTS '$DB_USER'@'%'"
mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'"
mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'"

#Clonamos el codigo fuente del proyecto
rm -rf /tmp/iaw-practica-lamp
git clone https://github.com/josejuansanchez/iaw-practica-lamp.git /tmp/iaw-practica-lamp

#Copiamos el codigo fuente a /var/www/html
cp /tmp/iaw-practica-lamp/src/* /var/www/html

#Ejecutamos el script sql
mysql -u root $DB_NAME < /tmp/iaw-practica-lamp/db/database.sql
