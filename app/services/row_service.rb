class RowService
  def initialize(emission_service, sector_service, country_service)
    @emission_service = emission_service
    @sector_service = sector_service
    @country_service = country_service
  end

  def emissions_per_row(row)
    sector = @sector_service.create!(row)
    country = @country_service.create!(row)
    emissions = row.except('Sector', 'Parent sector', 'Country')
    @emission_service.create!(emissions, country, sector)
  end
end
