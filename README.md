# Cardimeter

A simple application that allows company shareholders cast their votes on matters.

## Features

### Admin

- Signs in to an admin account.
- Views all companies existing in Cardimeter.
- Adds companies on Cardimeter.
- Add/Remove shareholders to companies.
- Assigns/Edits shareholders' shares units in companies.
- Creates polls for companies.
- View all polls created for companies.
- View details of a poll created.
- Close polls.
- Delete polls that are closed.
- Publish polls for shareholders to vote on.
- Share the results of closed polls for shareholders to view.

### Users/Shareholders

- Creates an account.
- Signs in to owned account.
- Views all companies to which shares are owned.
- Views polls for every company to which shares are owned.
- Votes an item for all polls for which user is eligible through shares owned in the company for which poll was created.
- Views result of shared polls.

## NOTE:

The number of shares owned by a user translates to the number of votes he can cast on an item. <b>For instance:</b> a user with 1000 units of DANGCEM shares is limited to 1000 votes per item.

# Table of Contents

- [Getting Started](#Getting-Started "Goto Getting-Started")
- [Technology Stack](#Technology-Stack "Goto Technology-Stack")
- [Installation](#Installation "Goto Installation")
- [Database Setup](#Database-Setup "Goto Database-Setup")
- [Testing Cardimeter](#Testing-Cardimeter "Goto Testing-Cardimeter")

## Getting Started

This is application is a fullstack app built with Ruby on Rails.

## Technology Stack

- Ruby - v2.5.1
- Ruby on Rails - v6.0.3.4
- Postgresql
- Bootsrap - v5.0.0-alpha1

## Installation

1. Install Ruby on your machine.

2. Clone the repository.

3. Change directory into the root of the project directory.

4. Run `bundle install` on the terminal to install project dependecies.

5. Follow the instructions on database setup to configure database.

6. Start the application: `rails s`.

## Database Setup

1. Install Postgres on your machine.

2. Create a `.env` file in the root of the project directory.

3. Copy the variables in the `.env.sample` file into the `.env` file and provide the required database credentials.

4. Run `rake db:setup` command to setup your database.

5. Run `rake db:seed` command to seed the database.

## Testing Cardimeter

### Admin features

- Go to `db/seeds.rb` and copy the admin log in credentials - email and password.

- Note that before you can add shareholders to a company, the user/shareholder must have an existing account on Cardimeter. Therefore, you may have to create an account for the user before adding the user as a shareholder to any company.

- Test out all features outlined above for an admin.

### User features

- Create a new user account.

- Test out all features outlined above for a user.
