# Good Night App

## Versions
below are the versions used to create this app
- ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
- Rails 7.0.4.2
- node v19.3.0
- yarn 1.22.19
- database: postgres (PostgreSQL) 15.1

## Getting Started

Clone the repo:
```sh
git@github.com:desoto13/good-night.git
```

Run the bundler
```sh
bundle install
```

Assuming the postgresql has already been setup with the app, intiate the database
```sh
pg_ctl start
(Note: kindly create a postgres user profile good_night via postgres CLI) 
rails db:create
```
Run the migrations
```sh
rails db:migrate
```

## Running the app
Seeding the users (There should be a total of 6 users)
```sh
rails db:seed
```
Run the server
```sh
rails s
```

## API definitions
To simulate the current_user we used the following:

`id` - the id number of the current_user

`user_id` - the id number of another user


| VERB | Endpoints | Query Params | Body Params | Description |
|:----:|:---------:|:------------:|:-----------:|:-----------:|
| POST | /users/`user_id`/follow | N/A | { id: `id ` } | Follow another user |
| POST | /users/`user_id`/unfollow | N/A | { id: `id` } | Unfollow another user |
| POST | /sleep-records/time-keep | N/A | { id: `id` } | Record clock-in and clock-out |
| GET | /sleep-records/my-record | id=`id` | N/A | Return all clocked-in times of a user, ordered by created time |
| GET | /users/friends-records | id=`id` | N/A | Return all followed users sleep records in the past week ordered by sleep length |

Note: To use the query params simply append it at the end of the Endpoint

Example: /sleep-records/my-record?id=`id`
