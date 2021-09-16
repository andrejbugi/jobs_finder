# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


* Setting the database

* Postgres Database in Docker container

Open terminal, go to the main directory at the root of the application and run:

-- sh bin/postgres_up.sh

Then run:

-- rails db:create

<!-- While being in the root directory of the app, write in your terminal : 'docker-compose up'

-- We are using the latest version of postgresql

-- This should start the container.

-- While that service is running, we can then go and create the database in other terminal window.

-- Write the following: rails db:create -->
