class RowPublisher
  include QueuePublisher
  QUEUE_NAME = 'importer.rows'

  def initialize
    initialize_queue
  end

  private

  def queue_name
    QUEUE_NAME
  end
end