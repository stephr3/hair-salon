# :haircut::haircut::haircut: _Stylish Salon_ :haircut::haircut::haircut:

##### _With this application, a salon owner will be able to view, add, update, and delete clients and stylists, as well as assign clients to stylists._

## Technologies Used

* **Application**: *Ruby, Sinatra*<br>
* **Testing**: *Rspec, Capybara*<br>
* **Database**: *Postgres*

Installation
------------

Install *Stylish Salon* by cloning the repository.  
```
$ git clone https://github.com/stephr3/hair-salon
```

Install required gems:
```
$ bundle install
```

```
In PSQL:
CREATE DATABASE hair_salon;
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, phone varchar, stylist_id int);
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, phone varchar, specialty varchar);
```

Start the Sinatra webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in your browser of choice.

License
-------
_This software is licensed under the MIT license._<br>
Copyright (c) 2016 **Stephanie Gurung**
