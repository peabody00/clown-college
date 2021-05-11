# Chesapeake Clown College

Welcome to Chesapeake Clown College, a simple website that allows students and teachers to log into their accounts and manage courses, schedules, and activities.  This simple webpage is my Module 3, Ruby on Rails, project for Flatiron School.  

## Installation

To run this application first clone the code from GitHub.

After cloning the repository run `bundle install` to install any required gems.

Run `rails db:migrate` to create the tables and database.

If you want to use some starter data, run `rails db:seed`.

Run `rails s` from the prompt to start the local webserver.

In any browser, navigate to http://localhost:3000/ to start using the app.

To use the OmniAuth feature you will need to have a Google Developer account with your own ID and Secret.  Please see this [website](https://www.balbooa.com/gridbox-documentation/how-to-get-google-client-id-and-client-secret) for instructions on how to set that up.  Your ID and secret will go in the `.env` file which is not synced to GitHub.

## Usage

This is a simple website that mimics a college website.  Students can log in and create their class schedules and sign up for activities (this feature is still under construction).  Teachers can log in and create new courses and activities.

## License

This program is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).