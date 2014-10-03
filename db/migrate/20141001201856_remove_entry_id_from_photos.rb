class RemoveEntryIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :entry_id, :integer
  end
end
