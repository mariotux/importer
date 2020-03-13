namespace :csv do
  desc "Import CSV"
  task import: :environment do
    row_service = RowService.new(EmissionService.new, SectorService.new, CountryService.new)
    file_path = Rails.root.join('data', 'emissions.csv')
    CSV.foreach(file_path, headers: true) do |row|
      row_service.emissions_per_row(row.to_hash)
    end
  end
end
