  task anonymous: :environment do 
  	entries = Entry.all
    entries.each do |entry|
     if entry.content
       entry.content = entry.content.gsub(/Marial/, 'Mary')
       entry.content = entry.content.gsub(/Deanna/, 'Deidra')
       entry.content = entry.content.gsub(/Lauren/, 'Lucy')
       entry.content = entry.content.gsub(/Kayla/, 'Katy')
       entry.content = entry.content.gsub(/Jess/, 'Jasmine')
       entry.content = entry.content.gsub(/Kendra/, 'Kara')
       entry.save
     end
     
   end
  	
  end
