task dedupe: :environment do
    grouped = Entry.all.group_by { |entry| [entry.title, entry.content] }
    grouped.values.each do |duplicates|
      first_one = duplicates.shift 
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end