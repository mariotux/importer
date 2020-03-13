class EmissionService
  def create!(emissions, country, sector)
    emissions.each do |year, value|
      Emission.create!(
          year: year.to_i,
          value: value.to_f,
          country: country,
          sector: sector
      )
    end
  end
end