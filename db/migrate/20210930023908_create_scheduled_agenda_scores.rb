class CreateScheduledAgendaScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scheduled_agenda_scores do |t|
      t.references :scheduled_agenda, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :score
      t.decimal :rate
      t.decimal :total

      t.timestamps
    end
  end
end
