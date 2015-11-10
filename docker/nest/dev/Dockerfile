FROM ubuntu:14.04

RUN \
  locale-gen en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  apt-get install -y software-properties-common \
  && \
  add-apt-repository -y ppa:ondrej/php5-5.6 && \
  apt-get update && \
  apt-get install -y \
    php5-cli

RUN \
    apt-get install -y \
        php5-dev

RUN \
    pecl install mongo

COPY conf/etc/php5/mods-available/mongo.ini /etc/php5/mods-available/mongo.ini

RUN \
    ln -s /etc/php5/mods-available/mongo.ini /etc/php5/cli/conf.d/10-mongo.ini

RUN \
    apt-get install -y \
        wget \
        curl

RUN \
    apt-get install -y \
	php5-xdebug 

RUN \
  adduser --disabled-password --gecos '' r && \
  usermod -aG sudo r && \
  echo "r ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN \
    mkdir /home/r/bin && \
    cd /home/r/bin && \
    curl -sS https://getcomposer.org/installer | php && \
    mv /home/r/bin/composer.phar /home/r/bin/composer

COPY conf/etc/php5/cli/php.ini /etc/php5/cli/php.ini

ENV HOME /root

WORKDIR /root

CMD bash
