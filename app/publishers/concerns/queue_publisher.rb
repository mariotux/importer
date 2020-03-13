module QueuePublisher
  extend ActiveSupport::Concern

  def initialize_queue
    channel = BunnyPublisher.connection.create_channel
    @queue = channel.queue(queue_name, durable: true)
    @exchange  = channel.default_exchange
  end

  def publish(data)
    @exchange.publish(data.to_json,  type: 'direct', routing_key: @queue.name)
  end

end

