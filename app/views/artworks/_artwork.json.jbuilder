json.extract! artwork, :id, :name, :available, :price, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)