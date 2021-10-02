class CreateCertificateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :certificate_products do |t|
      t.references :certificate, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
