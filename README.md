# Top Score Ranking

Implemented Api for scoring player.

## Getting Started

Project setup for development and testing purposes.

### Prerequisites

* Ruby version

  - Ruby-3.0.1

* Rails vesrion

  - Rails-6.1.3

* Testing framework
  - RSpec

* Api Documentation
  - [rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation)

# Installation

 1. [Manual](#manual)

A step by step setup development env running.

## Manual

- Clone this repository

```
$ git clone https://github.com/vishalsabhaya/top_score_ranking.git
```

- Install a compatible version of PostgreSQL

```
$ cd top_score_ranking
```

- Initialize a new gemset (if using RVM) then install bundler

```
$ gem install bundler
```

- Install the application dependencies

```
$ bundle install
```

#### Database Configuration

*PostgreSQL* used as database for this application.
> Make sure PostgreSQL is installed in your machine and you have setup the  `database.yml` file correctly

- Database creation

```
$ bundle exec rails db:create
```

- Tables migration and preparing for tests

```
$ bundle exec rails db:migrate
$ bundle exec rails db:test:prepare
```

- check the *db/schema.rb* after migration completed successfully

#### Running Tests

Test cases written using *RSpec*

Run test cases using this command

```
$ bundle exec rspec
```

All the tests should be *GREEN* to pass all test cases

#### Running Application

- Starting application

> Make sure you are in the application folder and already installed application dependencies

```
$ rails s
```

- Check the application on browser, open the any browser of your choice and hit the following in the browser url *http://localhost:3000/*


```
localhost:3000
```

## Existing APIs

You can generate the existing endpoints documentation by running:
```
$ rake docs:generate_api
```

This will generate the api documentation on the `doc/api` folder.
Here you can find the markdown version and the html version. You can see the html version running:
```
$ open doc/api/index.html
```

These tests are generated using the [rspec-api-documentation](https://github.com/zipmark/rspec_api_documentation) gem. So when you write new `api requests tests`, you have to use the [rspec-api-documentation DSL](https://github.com/zipmark/rspec_api_documentation#dsl).
Feel free to check the current tests, take a look at the documentation or ask someone if you have any question about it.

## APIs documentation with [Postman](https://www.postman.com/)

- [Documentation](https://documenter.getpostman.com/view/17581673/UUxtFAzA)

## Author

* **Vishal Sabhaya** - [GitHub profile](https://github.com/vishalsabhaya)
