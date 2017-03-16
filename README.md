# README



## Ruby version

2.3.1

## Rails version

5.0.2

## Configuration

- You need to add your smtp configuration at the end of the file `config/enviroments/development.rb` 

- Change the email of sender `sender@gmail.com` in `app/mailers/application_mailer.rb` for your own sender

- Change the email `example@gmail.com` of the test user in `db/seeds.rb` for your own email recipient

## Database creation

This project use sqlite as a data base, to configure it run `rake db:setup db:migrate`

## Database initialization

Run seed to load default user for testing `rake db:seed`

## Deployment and run instructions

To start up the project run `rails s` and use this url `http://localhost:3000/users/1` in your browser.
When you call this url the `send mail` function is called in the methods `show` of the `app/controllers/users_controllers.rb`, this is only for test propose.

