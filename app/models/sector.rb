class Sector < ApplicationRecord
  belongs_to :parent, class_name: 'Sector', optional: true

  validates :name, presence: true, uniqueness: { scope: :parent }
end
