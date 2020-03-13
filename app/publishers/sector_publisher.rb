class SectorPublisher
  include QueuePublisher
  QUEUE_NAME = 'importer.sectors'

  def initialize
    initialize_queue
  end

  private

  def queue_name
    QUEUE_NAME
  end
end