class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.text :description
      t.decimal :high
      t.decimal :width
      t.decimal :weight
      t.text :observation

      t.timestamps
    end
  end
end
