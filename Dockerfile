FROM php:7.4-apache
RUN apt-get update && apt-get install -y python-pip python-dev python-virtualenv zlib1g-dev libxslt1-dev libffi-dev libssl-dev libapache2-mod-wsgi wget jq
RUN a2enmod wsgi
RUN mkdir /var/cache/apache2/python-egg-cache
RUN chown www-data:www-data /var/cache/apache2/python-egg-cache/
RUN mkdir -p /srv/ga4gh
WORKDIR /srv/ga4gh
RUN wget https://github.com/ga4gh/server/releases/download/data/ga4gh-example-data_4.6.tar
RUN tar -xf ga4gh-example-data_4.6.tar
RUN pip install cffi cryptography ga4gh Pygments==2.5.2
COPY config/application.wsgi /srv/ga4gh/
COPY config/config.py /srv/ga4gh/
COPY config/apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY config/ports.conf /etc/apache2/ports.conf

#export port IDs accordingly
EXPOSE 8083
