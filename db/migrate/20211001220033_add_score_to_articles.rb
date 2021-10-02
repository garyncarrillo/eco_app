class AddScoreToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :score, :decimal
  end
end
