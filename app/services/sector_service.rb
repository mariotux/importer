class SectorService
  def self.create!(sectors)
    SectorService.new.create!(sectors)
  end

  def create!(sectors)
    parent = find_or_create_parent(sectors['parent'])
    find_or_create_sector(sectors['sector'], parent)
  end

  private

  def find_or_create_parent(parent_name)
    parent = Sector.find_by(name: parent_name)
    parent = Sector.create!(name: parent_name) if parent_name && !parent

    parent
  end

  def find_or_create_sector(sector_name, parent)
    sector = Sector.find_by(name: sector_name, parent: parent)
    Sector.create!(name: sector_name, parent: parent) unless sector
  end
end
