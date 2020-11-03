# Pair Programming Challenge - Rails Apothecary

TODO: Styling

A local apothecary has asked you to help them build their brand new website (their former web developers went back to school to study Reiki).

It's up to you to finish building out the user functionality for the website and to make sure people are able to sign up, log in, and prescribe their proper treatments.

## Getting Started

Be sure to read the entire challenge before beginning.

Fork and clone the challenge. Move into the proper directory and run `bundle install`. You can run migrations now or wait until you feel confident with how the database has been set up.

When you run migrations, also run `rails db:seed` to pre-seed your database with treatments.

## Building the Models

The `Prescription` and `Treatment` models already exist. Additionally, there are routes, controllers, and views already set up for treatments. You'll have to build appropriate routes for prescriptions.

A `user` has many `prescriptions` and many `treatments` through prescriptions. Additionally, a `treatment` has many `prescriptions` and `users` through prescriptions.

Be aware that none of the things needed to set up the relationships are currently present in the models or the database.

## User Model

Generate a `User` model. The user should have a `username` and `password_digest`.

Enable the `bcrypt` gem and make sure the user has all the necessary macros to authenticate a password. Make sure a user's username is validated so that it's present and unique.

*HINT: Setting up BCrypt in Rails is the same as Sinatra, refer to old labs if you need help*

## Users and Sessions Controllers

Build out controllers as necessary so that users can login, signup, and logout. Keep in mind you may have to build custom routes for certain controller actions. Only include routes that'll be used.

The controllers for logging in and signing up look very similar to how they looked in Sinatra. Rails also automatically enables sessions for your use. If you'd like to build helper methods like `current_user` and `logged_in?`, you can utilize private methods or the helper files.

## Treatment Show and Index Page

Currently the show page for treatments is mostly correct, however there are two buttons on the page that don't work. One is a button to prescribe a treatment, the other is a button to unprescribe a treatment.

When the first button is clicked, that treatment needs to get prescribed to the current user. The other will unprescribe a treatment from the user.

The button ought to render conditionally so that if a user isn't prescribed to a treatment, they only see the button to prescribe to it and vice versa.

The index page ought to utilize similar logic in order to conditionally render the proper button.

## User Profile Page

Build out a profile page for users that lists all the treatments prescribed to the current user. Next to each of the treatments is a button to unprescribe that treatment, similar to the one on the treatment show page.

**HINTS:**

- If you'd like to use helper methods, take a look at the [documentation for them](https://api.rubyonrails.org/classes/ActionController/Helpers.html). They may be helpful for utilizing certain things we've come to rely on like the `current_user`.

- Be sure to check your schema and make sure the proper foreign keys have been included.

- Since the prescribe / unprescribe buttons are available in several places, it might be good to create a partial for them...

**BONUSES:**

- A user shouldn't be prescribed the same treatment twice (no duplicate prescriptions)

- SUPERSTAR BONUS: Give the user an avatar using ActiveStorage. Their profile page should display the avatar if they have one.
