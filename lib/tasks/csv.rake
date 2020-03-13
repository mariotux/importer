namespace :csv do
  desc "Import CSV"
  task import: :environment do
    publisher = RowPublisher.new
    file_path = Rails.root.join('data', 'emissions.csv')
    CSV.foreach(file_path, headers: true) do |row|
      publisher.publish(row.to_hash)
        #return 1
    end
  end
end
