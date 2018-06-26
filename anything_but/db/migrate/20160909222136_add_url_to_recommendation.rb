class AddUrlToRecommendation < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :url, :string
  end
end
