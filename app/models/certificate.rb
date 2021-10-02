class Certificate < ApplicationRecord
  belongs_to :user

  has_many :certificate_products
  has_many :products, through: :certificate_products
end
