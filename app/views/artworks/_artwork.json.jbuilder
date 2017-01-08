json.extract! artwork,
              :id,
              :name,
              :available,
              :price,
              :medium_list,
              :created_at,
              :updated_at
json.image do
  json.full artwork.image.url
  json.thumb artwork.image.url(:thumb)
end
json.url artwork_url(artwork, format: :json)
