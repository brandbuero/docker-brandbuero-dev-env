#!/bin/bash
service php7.2-fpm start
cd /local
composer install
. /etc/apache2/envvars
apache2ctl -DFOREGROUND