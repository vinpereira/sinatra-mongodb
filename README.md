[![Dependency Status](https://gemnasium.com/badges/github.com/vinpereira/sinatra-mongodb.svg)](https://gemnasium.com/github.com/vinpereira/sinatra-mongodb)

# Ruby/Sinatra code to access MongoDB

A simple Ruby code to access RethinkDB and perform CRUD actions. Also, the code has a 'real-time change feed' to get all changes in database.

## Programming Language and libraries used

  - Ruby v2.4.1

Main libraries:
  - mongoid ~>6.2.0
  - sinatra ~>2.0.0
  - sinatra-contrib ~>2.0.0
  
### Running the code with MongoDB in Docker
- Start MongoDB container
```sh
$ docker run --name my-mongo -p 27017:27017 -d mongo
```

- Insert some data via irb

```sh
$ irb
require './server'
Book.create_indexes  
Book.create(title:'Foundation', author:'Isaac Asimov', isbn:'0553293354')
Book.create(title:'Dune', author:'Frank Herbert', isbn:'0441172717')
Book.create(title:'Hyperion (Hyperion Cantos)', author:'Dan Simmons', isbn:'0553283685')
```

- Clone this repository

- Run repo code via Docker with 
  1. ```docker build -t sinatra-mongo .```
  2. ```docker run -d --name my-app-container -p 9292:9292 --link my-mongo:mongo sinatra-mongo```
  3. Go to `localhost:9292/api/v1/books` (see more routes at server.rb)

    - Once started, it is possible to add/update/delete documents using cURL:
    
    ``` curl -i -X POST -H "Content-Type: application/json" -d'{"title":"The Power Of Habit", "author":"Charles Duhigg", "isbn":"081298160X"}' http://localhost:9292/api/v1/books ```