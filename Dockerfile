# Gunakan base image PHP-FPM Alpine (lebih ringan)
FROM php:8.1-fpm-alpine AS php

# composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Set timezone ke Asia/Jakarta
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime \
    && echo "Asia/Jakarta" > /etc/timezone

RUN apk add --no-cache git autoconf g++ make pcre-dev icu-dev \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del autoconf g++ make pcre-dev icu-dev \
    && rm -rf /var/cache/apk/*


# Install dependencies, lalu hapus cache agar ukuran tetap kecil
RUN apk add --no-cache --virtual .build-deps \
    postgresql-dev libpng-dev freetype-dev libjpeg-turbo-dev openldap-dev \
    && apk add --no-cache nginx supervisor postgresql-client libzip-dev libpng freetype libjpeg-turbo openldap \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure ldap \
    && docker-php-ext-install pdo_pgsql pgsql bcmath ftp zip gd ldap \
    && apk del .build-deps libpng-dev freetype-dev libjpeg-turbo-dev openldap-dev

# Buat folder socket & atur permission
RUN mkdir -p /run/php && chown nginx:nginx /run/php

RUN mkdir -p /usr/share/nginx/html && chown nginx:nginx /usr/share/nginx/html

RUN rm /usr/local/etc/php-fpm.d/docker.conf       
RUN rm /usr/local/etc/php-fpm.d/www.conf          
RUN rm /usr/local/etc/php-fpm.d/www.conf.default  
RUN rm /usr/local/etc/php-fpm.d/zz-docker.conf

# Copy konfigurasi Nginx & Supervisor
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY index.php /usr/share/nginx/html/
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN sed -i 's/^expose_php\s*=\s*On/expose_php = Off/' /usr/local/etc/php/php.ini

# Expose port untuk Nginx
EXPOSE 80

# Jalankan supervisord untuk mengelola Nginx & PHP-FPM
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
