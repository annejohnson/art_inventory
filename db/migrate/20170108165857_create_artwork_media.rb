class CreateArtworkMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :artwork_media do |t|
      t.references :artwork, index: true, foreign_key: true
      t.references :medium, index: true, foreign_key: true

      t.timestamps
    end
  end
end
