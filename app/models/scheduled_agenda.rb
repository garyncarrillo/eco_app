class ScheduledAgenda < ApplicationRecord
  STATE_INITIAL = 'initial'
  STATE_QUALITY = 'quality'

  has_many :collects
  has_many :products, through: :collects

  has_one :scheduled_agenda_score
  belongs_to :owner, class_name: "User", foreign_key: 'owner_id'

  def quality
    ScheduledAgendaScore.where(scheduled_agenda_id: self.id).destroy_all
    total = 0
    self.products.each do |product|
      total = total + product.category.score
      ScheduledAgendaScore.create(
        scheduled_agenda_id: self.id,
        product_id: product.id,
        score: product.category.score,
        rate: product.category.rate,
        total: product.category.score * product.category.rate,
        owner_id: self.owner_id
      )
    end

    user = User.find(self.owner_id)
    user.score = total
    user.save!

    self.state =  ScheduledAgenda::STATE_QUALITY
    self.save!
  end
end
