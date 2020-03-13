# README

## Requirements
- Docker
- ruby 2.6.5
- Rails 6.0.2.1

## Test solution with rabbitmq
This solution uses rabbitmq to run in background different workers to process the 
information in different threads and deliver the hard task, like to save information 
in the database, for the las process.


## Steps

1.- docker-compose up 

2.- rails db:create db:migrate

3.- rails rb:workers ( run this in a terminal 1, this task start the background workers )

4.- rails csv:import ( run this in a terminal 2, this start the import) 

Can you see the process of queues looking at the queues in rabbitmq: http://localhost:15672/#/queues