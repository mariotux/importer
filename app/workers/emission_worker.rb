class EmissionWorker
  include Sneakers::Worker
  from_queue ::EmissionPublisher::QUEUE_NAME

  def work(msg)
    emission = JSON.parse(msg)
    EmissionService.create!(emission)
    ack!
  rescue StandardError => e
    puts e.message
    puts emission
    requeue!
  end
end