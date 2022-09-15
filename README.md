 <!-- rails command -->

 <!-- devise install -->
 https://github.com/heartcombo/devise
bundle install --without production
rails generate devise:install
rails generate devise User
rails db:migrate
 <!-- bootstrap install -->
https://www.mashrurhossain.com/blog/rails6bootstrap4
yarn add bootstrap@4.3.1 jquery popper.js
https://github.com/hisea/devise-bootstrap-views
bundle install
rails generate devise:views:bootstrap_templates

 <!-- 抜けてるかも -->

rails g resource UserStock user:references stock:references
rails db:migrate
rails g migration add_first_last_name_to_users
rails db:migrate
rails g model Friendship user:references
rails db:migrate
rails g controller friendships create destroy
