class ScheduledAgendaScore < ApplicationRecord
  belongs_to :scheduled_agenda
  belongs_to :product
end
