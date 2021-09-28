class Collect < ApplicationRecord
  belongs_to :product
  belongs_to :scheduled_agenda
end
