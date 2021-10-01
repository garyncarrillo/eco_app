class AddOwnerToScheduledAgendas < ActiveRecord::Migration[6.1]
  def change
    add_reference :scheduled_agendas, :owner, foreign_key: { to_table: :users }
  end
end
