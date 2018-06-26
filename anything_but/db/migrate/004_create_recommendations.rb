class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.string :name
      t.integer :neighborhood_id
      t.timestamps
    end
  end
end
