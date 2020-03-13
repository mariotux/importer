class SectorWorker
  include Sneakers::Worker
  from_queue ::SectorPublisher::QUEUE_NAME

  def work(msg)
    sectors = JSON.parse(msg)
    SectorService.create!(sectors)
    ack!
  rescue StandardError => e
    puts e.message
    requeue!
  end
end