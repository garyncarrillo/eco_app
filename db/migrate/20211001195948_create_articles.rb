class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.decimal :stock
      t.decimal :rate

      t.timestamps
    end
  end
end
