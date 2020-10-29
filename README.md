# Pair Programming Challenge - Rails Apothecary

TODO: Styling

A local apothecary has asked you to help them build their brand new website (their former web developers went back to school to study Reiki).

It's up to you to finish building out the user functionality for the website and to make sure people are able to sign up, log in, and prescribe their proper treatments.

## Getting Started

Be sure to read the entire challenge before beginning.

Fork and clone the challenge. Move into the proper directory and run `bundle install`. You can run migrations now or wait until you feel confident with how the database has been set up.

When you run migrations, also run `rails db:seed` afterwards.

## Building the Models

The `Prescription` and `Treatment` models already exist. Additionally, there are routes, controllers, and views already set up for treatments.

A `user` has many `prescriptions` and many `treatments` through prescriptions. Additionally, a `treatment` has many `prescriptions` and `users` through prescriptions.

Be aware that none of the things needed to set up the relationships are currently present included in the database.

## User Model

Generate a `User` model. The user should have an `username` and `password_digest`.

Enable the `bcrypt` gem and make sure the user has all the necessary macros to authenticate a password. Make sure a user's username is validated so that it's present and unique.

*HINT: Setting up BCrypt in Rails is the same as Sinatra*

## Users and Sessions Controllers

Build out controllers as necessary so that users can login, signup, and logout. Keep in mind you may have to build custom routes for certain controller actions. Be sure not to include routes without controllers actions or that lead to empty view pages.

The controllers for logging in and signing up with look very similar to how they looked in Sinatra. Rails also automatically enables sessions if you'd like to use them.

## Treatment Show Page

Currently the show page for treatments is mostly correct, however there's a single button on the page to prescribe a treatment that doesn't work.

When the button is clicked, that treatment needs to get prescribed to the current user.

The button renders conditionally and if the user is already prescribed, a different button instead allows a user to unprescribe the treatment.

## User Profile Page

Build out a profile page for users that lists all the treatments prescribed to the current user. Next to each of the treatments is a button to unprescribe that treatment.

**HINTS:**

If you'd like to use helper methods, take a look at the [documentation for them](https://api.rubyonrails.org/classes/ActionController/Helpers.html). They may be helpful for utilizing certain things we've come to rely on like the `current_user`.

Be sure to check your schema and make sure the proper foreign keys have been included.

**BONUSES:**

- Also give the user an avatar using ActiveStorage. Their profile page should display the avatar if they have one.

- A user shouldn't be prescribed the same treatment twice (no prescriptions that are duplicates)
