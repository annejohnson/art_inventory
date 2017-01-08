class Medium < ApplicationRecord
  validates :name,
            uniqueness: true,
            presence: true

  has_many :artwork_media, dependent: :destroy
  has_many :artworks, through: :artwork_media

  before_save :format_name

  def self.format_name(name)
    name.to_s.
      strip.
      gsub(/\s+/, ' ')
  end

  private

  def format_name
    self.name = self.class.format_name(name)
  end
end
