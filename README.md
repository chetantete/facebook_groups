# Rails Facebook Groups Application

This is Rails FaceBook Groups Application
This application has following features: 
- login with Facebook
- List facebook Groups
- List Facebbok Groups > Posts/Feeds
- Manage keywords
- send notification if new post added matching Keyword

## This application has APIs as below: 

# List facebook Groups
  method: GET
  localhost:3000/groups?token={facebook authentication/access_token}

# List Facebbok Groups > Posts/Feeds
  method: GET
  localhost:3000/posts?group_id=1&token={facebook authentication/access_token}

# Manage keywords
## list keywords 
  method: GET
  localhost:3000/keywords?group_id=1&token={facebook authentication/access_token}

## create keywords 
	method: POST
  localhost:3000/keywords?keyword=test&group_id=1&token={facebook authentication/access_token}

## update keywords 
   method: PUT
  localhost:3000/keywords?keyword=post&group_id=1&token={facebook authentication/access_token}

## delete keyword 
  localhost:3000/keywords?id=1&group_id=1&token={facebook authentication/access_token}
  method: DELETE


### Installation

```sh
$ rvm 2.6.4
$ bundle
$ update database.yml file
$ rake db:create
$ rake db:migrate
<!-- $ rake db:seed -->
$ rails s
```
### Online Demo
[https://polar-inlet-85607.herokuapp.com/](https://polar-inlet-85607.herokuapp.com/) 


### Testing Users

| user | password |
| ------ | ------ |
| test-1@gmail.com | 123456 |
| test-2@gmail.com | 123456 |


Thanks!