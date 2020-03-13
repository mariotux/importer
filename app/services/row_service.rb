class RowService
  def initialize(emission_publisher, sector_publisher, country_publisher)
    @emission_publisher = emission_publisher
    @sector_publisher = sector_publisher
    @country_publisher = country_publisher
  end

  def emission_per_row(row)
    sector = get_sector(row)
    @sector_publisher.publish(sector)
    country = get_country(row)
    @country_publisher.publish(country)
    emissions = row.except('Sector', 'Parent sector', 'Country')
    publish_emissions(emissions, sector, country)
  end

  private

  def publish_emissions(emissions, sector_names, country_name)
    emissions.each do |year, value|
      emission = {
          year: year.to_i,
          value: value.to_f,
          country: country_name,
          sector: sector_names
      }
      @emission_publisher.publish(emission)
    end
  end

  def get_sector(row)
    {
        sector: row['Sector'],
        parent: row['Parent sector']
    }
  end

  def get_country(row)
    {
        country: row['Country']
    }
  end
end
