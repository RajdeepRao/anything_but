class CreateActivityRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_recommendations do |t|
      t.integer :activity_id
      t.integer :recommendation_id
      t.timestamps
    end
  end
end
