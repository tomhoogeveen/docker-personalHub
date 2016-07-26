#!/bin/bash


git clone https://gitlab.com/tomhoogeveen/personalHub.git
cd personalHub
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
chmod -R 777 .
php /usr/local/bin/composer install

gem install sass
ln -s /usr/local/bin/sass /usr/bin/sass

php bin/console cache:clear
php bin/console assets:install web
php bin/console assetic:dump

chmod -R 777 .
mkdir /app/personalHub/web/credentials/secret

php bin/console app:google_calendar_command
chmod -R 777 .

#mkdir -p app/cache app/logs
#touch app/logs/prod.log
chgrp -R www-data .
#chmod -R g+w app/cache app/logs

source /etc/apache2/envvars

tail -F /var/log/apache2/* app/logs/prod.log &
exec apache2 -D FOREGROUND

