class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.text :caption
      t.integer :entry_id

      t.timestamps
    end
  end
end
