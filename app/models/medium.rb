class Medium < ApplicationRecord
  has_many :artwork_media
  has_many :artworks, through: :artwork_media
end
