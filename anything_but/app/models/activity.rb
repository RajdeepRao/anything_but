class Activity < ApplicationRecord
  has_many :activity_recommendations
  has_many :recommendations, through: :activity_recommendations
end
