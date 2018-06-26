class Neighborhood < ApplicationRecord
  has_many :recommendations
  belongs_to :city
end
