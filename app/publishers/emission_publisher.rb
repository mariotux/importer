class EmissionPublisher
  include QueuePublisher
  QUEUE_NAME = 'importer.emissions'

  def initialize
    initialize_queue
  end

  private

  def queue_name
    QUEUE_NAME
  end
end