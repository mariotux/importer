# == Schema Information
#
# Table name: emissions
#
#  id         :bigint           not null, primary key
#  value      :float            not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :bigint
#  sector_id  :bigint
#
# Indexes
#
#  index_emissions_on_country_id  (country_id)
#  index_emissions_on_sector_id   (sector_id)
#
class Emission < ApplicationRecord
  belongs_to :sector
  belongs_to :country
  validates :year, presence: true
  validates :value, presence: true
end
