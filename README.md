# JobsFinder!

## JobsFinder! it's a modern web application for applying to available jobs everywhere.
## If you are a company, you can create account and post your job openings. If you are in look for a new job, then you can apply on the already open job positions.

### Authors: Andrej Kostov (andrejbugi96@gmail.com)


# Requirements

- ruby 2.6.5
- rails >= 6.0.4.1
- Bundler version 2.2.7


# What you can do with JobsFinder

  Find your dream job on JobsFinder!

  **Applying to jobs cannot be easier!**

  Just fint the job that you want and send your application.
  Person responsible for that job will get notified via email and after receiving your application he will
  contact you!


## Usage and Installation

  This is how you can test this application:

  First you need to clone JobsFinder from GitHub.

  Open your terminal and write:
  - git clone https://github.com/andrejbugi/jobs_finder.git

  It will make a directory called 'jobs_finder' on your hard disk. Go into that directory.

  In the terminal:
  - cd jobs_finder

  Now we need to add all the **gems required**(check requirements).

  Check your bundler version if it is 2.2.7.

  Run:
  - bundle install

  For database we are using Postgres Database in Docker container.

  First we need to install docker. Pick your operating system and follow the instructions:

  https://docs.docker.com/get-docker/

  After installing docker on your machine, we can proceed with the db

  To use the database, write the next commands on your terminal:

  1. docker pull postgres

  2. sh bin/postgres_up.sh

  3. rails db:setup

  This will get the database up and running.

  This command will give you some examples for trying out the application.

  **Example users' login info:**
  - user@email.com, pass: 12341234
  - user1@email.com, pass: 12341234

  To run the tests, run:

  - rspec

  To start the app(server), write the next command in you terminal
  - rails server

  This will start the server, then in the browser go to: localhost:3000

  You should now be able to see all the Jobs

  **Have Fun and Get your Dream Job!**
