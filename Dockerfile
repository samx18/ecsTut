FROM ubuntu:12.04

# Install dependencies and Apache
RUN apt-get update -y
RUN apt-get install -y apache2

# Hello world

RUN echo "Hello World" > /var/www/index.html

# Configure Apache

RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

expose 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]


