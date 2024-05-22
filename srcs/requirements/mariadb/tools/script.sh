#!/bin/bash

service mariadb start

sleep 2

mariadb -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop

exec mysqld_safe --bind-address=0.0.0.0


#  THIS SCRIPT IS FOR :

    # Starts the MariaDB service.
    # Creates a database if it doesn't exist.
    # Creates a user and grants them all privileges on the specified database.
    # Reloads the database privileges to ensure the changes take effect.
    # Stops the MariaDB service.
    # Restarts it in a mode that allows connections from any IP address.