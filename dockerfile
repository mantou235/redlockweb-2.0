# kirsten la07 2540119204

# base image utk docker (sesuai dgn permintaan soal: image menggunakan PHP 8.1.x+webserver)
FROM php:8.1-apache

# working directory
WORKDIR /var/www/html

# install libmariadb (library buat install mysqli)
RUN apt-get update -y && apt-get install -y libmariadb-dev
# install mysqli (untuk bisa connect ke database MariaDB/MySQL)
RUN docker-php-ext-install mysqli

# permissions
RUN chown -R www-data:www-data /var/www/html && \
    # directory /var/www/html (chown = change owner, -R = dir & subdir) 
        # ganti kepemilikan ke www-data
    chmod -R o--wx /var/www/html && \
    # o = other users, w = write, x = execute
        # chmod = change mode, dapat me-modify permission untuk control access
    chmod -R u+w /var/www/html
    # validasi mode bahwa diberikan control access untuk 'w'=write 
        # kepada mereka semua files yang berada di 'u'=under directory /var/www/html