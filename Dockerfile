FROM composer:1.7 as deps

WORKDIR /app
COPY composer* ./
RUN composer install --ignore-platform-reqs

FROM ubuntu:18.04 as app

WORKDIR /var/www/html
COPY --from=deps /app/vendor /var/www/html/vendor

COPY . ./

CMD ['echo', 'hello world']

