class CountryService
  def self.create!(country)
    CountryService.new.create!(country)
  end

  def create!(country)
    Country.create!(name: country) unless Country.find_by(name: country)
  end
end