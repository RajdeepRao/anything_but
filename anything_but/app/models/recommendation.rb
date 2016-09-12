class Recommendation < ApplicationRecord
  has_many :activity_recommendations
  has_many :activities, through: :activity_recommendations
  has_many :user_recommendations
  has_many :users, through: :user_recommendations
  # belongs_to :neighborhood

  @@filtered_array=[]
  @@previous_search=false

  def self.filtered_array=(array)
    @@filtered_array=array
  end

  def self.filtered_array
    @@filtered_array
  end

  def self.previous_search=(boolean)
    @@previous_search=boolean
  end

  def self.previous_search
    @@previous_search
  end
end
