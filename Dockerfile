FROM php:8.1-fpm

RUN echo "Dockerfile executed successfully"
# Install msmtp, mysqli, and other required tools
RUN apt-get update && apt-get install -y \
    msmtp \
    msmtp-mta \
    libmariadb-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli

# Copy the msmtp config file into the container
COPY msmtprc /etc/msmtprc
RUN chmod 600 /etc/msmtprc

# Set default sendmail path to use msmtp
RUN echo "sendmail_path = \"/usr/bin/msmtp -t\"" >> /usr/local/etc/php/conf.d/sendmail.ini

# Start PHP-FPM
CMD ["php-fpm"]
