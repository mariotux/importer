class RowWorker
  include Sneakers::Worker
  from_queue ::RowPublisher::QUEUE_NAME

  def initialize(queue = nil, pool = nil, opts = {})
    @row_service = RowService.new(EmissionPublisher.new, SectorPublisher.new, CountryPublisher.new)
    super(queue, pool, opts)
  end

  def work(msg)
    row = JSON.parse(msg)
    @row_service.emission_per_row(row)
    ack!
  rescue StandardError => e
    puts e.message
    requeue!
  end
end