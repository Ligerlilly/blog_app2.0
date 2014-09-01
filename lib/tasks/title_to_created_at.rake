task title_to_created_at: :environment do
  Entry.all.each do |entry|
    if Date.strptime(entry.title, '%m/%d/%Y')
      entry.created_at = Date.strptime(entry.title, '%m/%d/%Y')
      entry.save
    end
  end
end