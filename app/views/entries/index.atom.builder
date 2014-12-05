atom_feed do |feed|
  feed.title "JayBlog"
  feed.updated @entries.maximum(:updated_at)
  
  @entries.each do |post|
    feed.entry post, published: post.created_at do |entry|
      entry.title post.title
      entry.content post.content, type: 'html'
    end
  end
end