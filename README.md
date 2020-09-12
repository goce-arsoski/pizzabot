# Pizzabot

The purpose of this gem file is to provide a list of instructions about the way of how a Pizzabot could deliver pizzas to all houses in a neighborhood.
The Pizzabot allways starts at the origin point (0,0).

_______________
## Requirements
---------------

In order to install this gem you need to have the minimun requirements:

- Ruby version 2.6.5
- Rails 6.0.3

_______________
## Installation
---------------

Add this line to your application's Gemfile:

```ruby
gem 'pizzabot', '~> 0.1.0'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pizzabot

________
## Tests
--------

To view the tests for Pizzabot you need to run `rspec` or `rake` from the command line.

________
## Usage
--------

If you would like to run the Pizzabot you need to run command `./pizzabot` from the comand line, i.e. `./pizzabot '5x5 (1, 3) (4, 4)'`. Also you can run `bin/console` for an interactive prompt, create an object e.g. `pizzabot = RobotDelivery.new('5x5 (1, 3) (4, 4)')`, where a grid range is `'5x5'` and coordinates (list of points) representing houses in need of pizza delivery are `'(1, 3) (4, 4)'` in format (x,y) then type `pizzabot.delivery`.
