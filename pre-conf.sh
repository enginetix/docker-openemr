#!/bin/bash

wget https://github.com/openemr/openemr/archive/v5_0_0_5.tar.gz
tar -pxvzf v5_0_0_5.tar.gz
rm v5_0_0_5.tar.gz
mv openemr-5_0_0_5 /var/www/openemr
chown -R www-data:www-data /var/www/openemr

#remove the basic page for apache
rm -R /var/www/html
 #to fix error relate to ip address of container  apache2
 echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
 #change document root
 sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/openemr/' /etc/apache2/sites-available/000-default.conf
