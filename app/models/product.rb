class Product < ApplicationRecord
  has_many :collects
  has_many :scheduled_agendas, through: :collects
end
