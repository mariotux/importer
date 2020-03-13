# README

## Requirements
- Docker
- ruby 2.6.5
- Rails 6.0.2.1

## Test solution 
This solution uses a task who it read the csv file and it is processing each csv line
 as different emissions.


## Steps

1.- docker-compose up 

2.- rails db:create db:migrate

3.- rails csv:import 

The task doesn't print anything in the console, but you can run a rails console to check the
results of each object.