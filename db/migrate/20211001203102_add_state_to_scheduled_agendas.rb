class AddStateToScheduledAgendas < ActiveRecord::Migration[6.1]
  def change
    add_column :scheduled_agendas, :state, :string
  end
end
