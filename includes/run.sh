#!/bin/bash
service php7.2-fpm start
cd /local
composer install
npm install
gulp build
. /etc/apache2/envvars
apache2ctl -DFOREGROUND