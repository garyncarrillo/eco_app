class CreateCertificates < ActiveRecord::Migration[6.1]
  def change
    create_table :certificates do |t|
      t.references :user, null: false, foreign_key: true
      t.string :total_scores

      t.timestamps
    end
  end
end
