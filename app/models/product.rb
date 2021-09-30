class Product < ApplicationRecord
  has_many :collects
  has_many :scheduled_agendas, through: :collects
  belongs_to :category
end
