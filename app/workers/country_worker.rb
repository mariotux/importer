class CountryWorker
  include Sneakers::Worker
  from_queue ::CountryPublisher::QUEUE_NAME

  def work(msg)
    country = JSON.parse(msg)
    CountryService.create!(country['country'])
    ack!
  rescue StandardError => e
    puts e.message
    requeue!
  end
end