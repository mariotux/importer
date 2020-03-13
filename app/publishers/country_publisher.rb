class CountryPublisher
  include QueuePublisher
  QUEUE_NAME = 'importer.countries'

  def initialize
    initialize_queue
  end

  private

  def queue_name
    QUEUE_NAME
  end
end
