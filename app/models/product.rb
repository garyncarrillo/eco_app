class Product < ApplicationRecord
  has_many :collects
  has_many :scheduled_agendas, through: :collects
  
  belongs_to :category

  has_many :certificate_products
  has_many :certificates, through: :certificate_products
end
