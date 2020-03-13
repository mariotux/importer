class CountryService
  def create!(row)
    country_name = row['Country']
    country = Country.find_by(name: country_name)
    country = Country.create!(name: country_name) unless country
    country
  end
end