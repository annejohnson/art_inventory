class MigrateMediaDataToJoinTable < ActiveRecord::Migration[5.0]
  def up
    ActsAsTaggableOn::Tagging.includes(:tag).find_each do |tagging|
      tag = tagging.tag

      medium = Medium.where(name: tag.name).first_or_create
      ArtworkMedium.create(
        medium: medium,
        artwork: tagging.taggable
      )

      tagging.destroy
      tag.destroy if tag.taggings.blank?
    end
  end

  def down
    ArtworkMedium.includes(:medium, :artwork).find_each do |artwork_medium|
      tag = ActsAsTaggableOn::Tag.where(
        name: artwork_medium.medium.name
      ).first_or_create

      ActsAsTaggableOn::Tagging.create(
        tag: tag,
        taggable: artwork_medium.artwork,
        context: 'media'
      )

      artwork_medium.destroy
    end
  end
end
