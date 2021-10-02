json.extract! article, :id, :name, :stock, :rate, :score, :created_at, :updated_at
json.url article_url(article, format: :json)
