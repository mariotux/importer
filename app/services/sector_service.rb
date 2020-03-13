class SectorService
  def create!(row)
    parent = find_or_create_parent(row['Parent sector'])
    find_or_create_sector(row['Sector'], parent)
  end

  private

  def find_or_create_parent(parent_name)
    parent = Sector.find_by(name: parent_name)
    parent = Sector.create!(name: parent_name) if parent_name && !parent

    parent
  end

  def find_or_create_sector(sector_name, parent)
    sector = Sector.find_by(name: sector_name, parent: parent)
    sector = Sector.create!(name: sector_name, parent: parent) unless sector

    sector
  end
end
