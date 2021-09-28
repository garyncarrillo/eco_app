class CreateCollects < ActiveRecord::Migration[6.1]
  def change
    create_table :collects do |t|
      t.references :product, null: false, foreign_key: true
      t.references :scheduled_agenda, null: false, foreign_key: true

      t.timestamps
    end
  end
end
