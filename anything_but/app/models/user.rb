class User < ApplicationRecord
  has_secure_password
  has_many :user_recommendations
  has_many :recommendations, through: :user_recommendations

end
