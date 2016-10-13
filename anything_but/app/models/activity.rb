class Activity < ApplicationRecord
  has_many :activity_recommendations
  has_many :recommendations, through: :activity_recommendations
  validates :name, presence: true

  def self.search(term)
  where("name ILIKE ?", "%#{term}%")
  end
end
