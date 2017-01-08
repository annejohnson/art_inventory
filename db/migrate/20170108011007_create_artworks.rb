class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :name
      t.boolean :available
      t.decimal :price

      t.timestamps
    end
  end
end
