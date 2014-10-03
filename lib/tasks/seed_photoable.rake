task seed_photoable: :environment do
  photos = Photo.all
  photos.each do |photo|
    photo.photoable_id = photo.entry_id
    photo.photoable_type = "Entry"
    photo.save
  end
end