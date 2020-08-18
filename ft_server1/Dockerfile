FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install openssl vim
RUN apt-get -y install php-fpm php-mbstring
RUN apt-get -y install mariadb-server php-mysql
RUN apt-get -y install wget

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj '/C=FR/ST=mkhemakh/L=mkhemakh/O=Guru Project/OU=Research team/emailAddress=root@index.com'
RUN mv localhost.dev.crt etc/ssl/certs/
RUN mv localhost.dev.key etc/ssl/private/
RUN chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key
RUN wget https://files.phpmyadmin.net/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages.tar.gz /var/www/phpmyadmin
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv wordpress/ var/www/html/
RUN chown -R www-data:www-data /var/www/html/wordpress

COPY ./srcs/init_container.sh ./
COPY ./srcs/config.inc.php var/www/html/phpmyadmin/config.inc.php
COPY ./srcs/default etc/nginx/sites-available/default
COPY ./srcs/wp-config.php var/www/html/wordpress/wp-config.php


CMD init_container.sh