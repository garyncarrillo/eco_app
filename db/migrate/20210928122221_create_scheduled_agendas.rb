class CreateScheduledAgendas < ActiveRecord::Migration[6.1]
  def change
    create_table :scheduled_agendas do |t|
      t.string :address
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone_number
      t.date :scheduled_date

      t.timestamps
    end
  end
end
