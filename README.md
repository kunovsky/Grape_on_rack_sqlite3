Grape API Without ORM Using SQLite3
===================================
I wanted the challenge of building a grape api without using an ORM

#Instructions

- Run the follwing commands to get started

1. rake db:create
2. rake db:seed
3. rake testprep
3. rackup

- You can then visit the api at the following endpoints 

http://http://localhost:9292/v1/records/first_name - this give you a list of all users sorted by first name

http://http://localhost:9292/v1/records/last_name - this gives you a list of all users sorted by last name

http://http://localhost:9292/v1/records/created_at - this gives you a list of all users sorted by created at date

- You can also make a post request using curl like so:

curl -X POST "http://http://localhost:9292/v1/records/first_name|last_name|email|phone|created_at"

- Run 'rake spec' to run the specs

- Run 'rake db:drop' to delete the database

