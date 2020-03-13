# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_countries_on_name  (name) UNIQUE
#
class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
