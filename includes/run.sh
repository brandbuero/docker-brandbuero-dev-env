#!/bin/bash
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
service php7.2-fpm start
cd /local
composer install
npm install
gulp build
. /etc/apache2/envvars
apache2ctl -DFOREGROUND