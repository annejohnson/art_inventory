class Artwork < ApplicationRecord
  has_attached_file :image, styles: { thumb: "150x150>" }
  validates_attachment(
    :image,
    presence: true,
    content_type: { content_type: /\Aimage\/.*\z/ }
  )

  validates :price, numericality: { allow_nil: true,
                                    greater_than_or_equal_to: 0 }

  has_many :artwork_media
  has_many :media, through: :artwork_media
end
