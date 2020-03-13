class Emission < ApplicationRecord
  belongs_to :sector
  belongs_to :country
  validates :year, presence: true
  validates :value, presence: true
end
