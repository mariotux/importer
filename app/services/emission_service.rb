class EmissionService
  def self.create!(emission)
    EmissionService.new.create!(emission)
  end

  def create!(emission)
    sector = get_sector(emission['sector'])
    country = get_country(emission['country'])
    Emission.create!(
        year: emission['year'],
        value: emission['value'],
        country: country,
        sector: sector
    )
  end

  private

  def get_sector(data)
    parent = Sector.find_by(name: data['parent']) if data['parent']
    Sector.find_by!(name: data['sector'], parent: parent)
  end

  def get_country(data)
    Country.find_by!(name: data['country'])
  end
end