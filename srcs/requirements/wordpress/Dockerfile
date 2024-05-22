FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y  && \
	apt-get install -y wget

RUN apt update -y && apt install php-fpm php-mysql -y \
    && apt install curl -y

RUN mkdir -p /run/php/ && \
    mkdir -p /var/www

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

RUN wget -O wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz -C /var/www \
    && rm wordpress.tar.gz

RUN chown -R root:root /var/www/wordpress
COPY ./tools/script.sh /var/www/
RUN sed -i 's#^listen =.*#listen = 9000#' /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod +x /var/www/script.sh

CMD ["sh", "/var/www/script.sh"]
