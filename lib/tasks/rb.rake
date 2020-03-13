require 'sneakers/spawner'

namespace :rb do
  desc "RabbitMQ Queues"
  task workers: :environment do
    Sneakers::Spawner.spawn
  end
end
