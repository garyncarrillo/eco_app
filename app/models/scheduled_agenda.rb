class ScheduledAgenda < ApplicationRecord
  has_many :collects
  has_many :products, through: :collects
end
