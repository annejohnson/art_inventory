class Artwork < ApplicationRecord
  has_attached_file :image, styles: { thumb: "150x150>" }
  validates_attachment(
    :image,
    presence: true,
    content_type: { content_type: /\Aimage\/.*\z/ }
  )

  validates :price, numericality: { allow_nil: true,
                                    greater_than_or_equal_to: 0 }

  has_many :artwork_media, dependent: :destroy
  has_many :media, through: :artwork_media

  def medium_list
    media.pluck(:name)
  end

  def medium_list=(medium_list)
    self.media =
      medium_list.map do |medium_name|
        Medium.where(
          name: Medium.format_name(medium_name)
        ).first_or_create
      end
  end
end
