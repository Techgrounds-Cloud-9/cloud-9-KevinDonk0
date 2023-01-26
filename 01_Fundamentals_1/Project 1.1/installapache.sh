#!/bin/bash
dpkg --configure -a
apt-get -y update

# Install Apache2
apt-get -y install apache2

# Write some HTML
# echo \<center\>\<h1\>My Demo App\</h1\>\<br/\>\</center\> > /var/www/html/demo.html

# restart Apache
apachectl restart

#Install certbot
#sudo apt-get install certbot python3-certbot-apache -y

#Command to create CA certicicate
#sudo certbot --apache -d kevin-techgrounds.westeurope.cloudapp.azure.com --register-unsafely-without-email --agree-tos --renew-by-default --redirect
#~
