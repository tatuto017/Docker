#!/bin/bash

db=mysql
db_host=mysql
db_name=webapp
db_user=webapp
db_pass=webapp

rm -rf /var/www/webapp/*
composer create-project --prefer-dist laravel/laravel webapp "6.*"
cd webapp
composer require barryvdh/laravel-debugbar
composer require beyondcode/laravel-query-detector --dev
php artisan vendor:publish --provider="Barryvdh\Debugbar\ServiceProvider"
php artisan vendor:publish --provider="BeyondCode\QueryDetector\QueryDetectorServiceProvider"
echo "DEBUGBAR_ENABLED=null" >> .env
cat .env |
sed -e "s/DB_CONNECTION=mysql/DB_CONNECTION=$db/"    \
    -e "s/DB_HOST=127.0.0.1/DB_HOST=$db_host/"       \
    -e "s/DB_DATABASE=laravel/DB_DATABASE=$db_name/" \
    -e "s/DB_USERNAME=root/DB_USERNAME=$db_user/"    \
    -e "s/DB_PASSWORD=/DB_PASSWORD=$db_pass/"       > .env.wk
mv .env.wk .env
