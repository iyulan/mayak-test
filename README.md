# Mayak test app

Развертывание приложения

* bundle install
* cp config/database.yml.copy config/database.yml
* rails db:create
* rails db:migrate
* rspec .
* rails s

Endpoints:

* GET /api/wildberries/products/:id
