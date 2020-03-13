# == Schema Information
#
# Table name: sectors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
# Indexes
#
#  index_sectors_on_name_and_parent_id  (name,parent_id) UNIQUE
#
class Sector < ApplicationRecord
  belongs_to :parent, class_name: 'Sector', optional: true

  validates :name, presence: true, uniqueness: { scope: :parent }
end
