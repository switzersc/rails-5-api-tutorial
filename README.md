# Rails 5 API tutorial

This demo shows a Rails 5 API with Swagger documentation and Test::Unit and Rspec testing. It uses ActiveModel::Serializers to comply with the JSON+API hypermedia spec.


## Getting started with Rails 5 and creating your own books API

Install Rails 5: 

    git clone https://github.com/rails/rails.git
    cd rails/
    bundle install

Generate API:

    bundle exec railties/exe/rails new ../books --edge --dev --api

Create Scaffold:

    bundle exec rails generate scaffold books title description:text page_count:integer

Migrate the database:

    bundle exec rake db:migrate
