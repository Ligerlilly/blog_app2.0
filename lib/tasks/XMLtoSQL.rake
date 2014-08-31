task xmltosql: :environment do
  xml_string = open("/home/user/public_html/jayBlog.xml").read
    root = Nokogiri::XML(xml_string)
    entries = root.xpath("//entry")
    entries.each do |entry|
    entry_hash = {
        content: entry.at_xpath("body").text.strip.to_s,
        title:  entry.at_xpath("date").text.strip.to_s
     }
        entry_record = Entry.create!(entry_hash)
        entry_record.save

    end
end