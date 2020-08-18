service mysql start

mysql < var/www/html/phpmyadmin/sql/create_tables.sql -u root --skip-password
mysqladmin -u root -p password 'root'

echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVLEGES ON wordpress.* TO 'root'@'%' indentified by 'root' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVLEGES;" | mysql -u root --skip-password

service php7.3-fpm start
service nginx start
bash