class AddOwnerToScheduledAgendaScores < ActiveRecord::Migration[6.1]
  def change
    add_reference :scheduled_agenda_scores, :owner, foreign_key: { to_table: :users }
  end
end
