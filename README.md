Property Manager
================

Things you may want to cover:

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

rails generate scaffold User email:string first_name:string last_name:string

rails generate scaffold Property rooms:integer facilities:string type:string rating:integer address:string

rails generate scaffold Reservation property_id:integer from:integer to:integer user_id:integer
