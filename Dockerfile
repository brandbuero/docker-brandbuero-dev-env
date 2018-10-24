FROM ubuntu:xenial
ENV DEBIAN_FRONTEND noninteractive
ENV NODE_VERSION 9.11.1
ENV NVM_DIR /root/.nvm
RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install locales software-properties-common git zip vim rsync apache2 mysql-client curl build-essential autoconf autogen libtool
RUN locale-gen en_US.UTF-8
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get -y install php7.2-fpm php7.2-zip php7.2-intl php7.2-cli php7.2-mysql php7.2-curl php7.2-gd php-imagick php7.2-mbstring php7.2-bcmath php7.2-soap php7.2-xml
RUN mkdir /local
RUN cd /usr/local/bin; curl --silent --show-error https://getcomposer.org/installer | php; mv composer.phar composer
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && npm install --global npm gulp-cli
RUN rm -rf /var/lib/apt/lists/*
RUN a2enmod proxy_fcgi
RUN a2enmod rewrite
RUN a2enconf php7.2-fpm
RUN mkdir /var/lock/apache2
ADD includes /
EXPOSE 80 88
CMD . /run.sh