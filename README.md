<h1>Book prestations & Get matched with pro's</h1>

<h2>Launch</h2>

Runs on Ruby 3.0.3 / Rails 7.0.3 (Webpack) / PostgreSQL DB

- `bundle install` / `rails db:create db:migrate db:seed`
- Ensure you have Bootstrap and its dependencies: `yarn add bootstrap @popperjs/core`
- `rails s` --> `localhost:3000` to make a booking

<h2>About the project</h2>

- Basic app that allows users to book one or more types of prestations (eg. haircuts) from home and get matched with a list of professionals depending on specific criteria:
  - Distance between the user (booking) and the pro's maximum radius of service delivery
  - Ability of the pro to perform the required prestations
  - Opening hours of the pro
  - Availability of the pro
- Contains unit specs for the models + extensive spec for the main `MatchPro` service
- Ran Rubocop and is offense-free

<h2>Schema</h2>

<img width="857" alt="image" src="https://user-images.githubusercontent.com/66962570/179194781-5dbc1b8d-538b-4812-bc67-6ff3dd38e054.png">
