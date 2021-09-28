json.extract! scheduled_agenda, :id, :address, :contact_name, :contact_email, :contact_phone_number, :scheduled_date, :created_at, :updated_at
json.url scheduled_agenda_url(scheduled_agenda, format: :json)
