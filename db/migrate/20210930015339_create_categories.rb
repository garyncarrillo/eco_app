class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :score
      t.decimal :rate
      t.boolean :is_active

      t.timestamps
    end
  end
end
