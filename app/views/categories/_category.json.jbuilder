json.extract! category, :id, :name, :score, :rate, :is_active, :created_at, :updated_at
json.url category_url(category, format: :json)
