class Artwork < ApplicationRecord
  has_attached_file :image, styles: { thumb: "150x150>" }
  validates_attachment(
    :image,
    presence: true,
    content_type: { content_type: /\Aimage\/.*\z/ }
  )
end
