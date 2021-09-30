class ScheduledAgenda < ApplicationRecord
  has_many :collects
  has_many :products, through: :collects

  def quality
    ScheduledAgendaScore.where(scheduled_agenda_id: self.id).destroy_all

    self.products.each do |product|
      ScheduledAgendaScore.create(
        scheduled_agenda_id: self.id,
        product_id: product.id,
        score: product.category.score,
        rate: product.category.rate,
        total: product.category.score * product.category.rate
      )
    end
  end
end
