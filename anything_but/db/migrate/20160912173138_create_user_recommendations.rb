class CreateUserRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_recommendations do |t|
      t.integer :user_id
      t.integer :recommendation_id
    end
  end
end
