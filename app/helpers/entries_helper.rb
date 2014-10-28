module EntriesHelper
  def show_all_comments(entry)
    render entry.comments
    
  end
end

