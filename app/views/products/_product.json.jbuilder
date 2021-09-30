json.extract! product, :id, :description, :high, :width, :weight, :observation, :created_at, :updated_at, :catgory_id
json.url product_url(product, format: :json)
