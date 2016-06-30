def facebook_search(songs)
  puts "Grabbing artist data from Facebook..."
  songs.each do |song|
    graph = Koala::Facebook::API.new("#{ENV['FB_TOKEN']}")
    search = graph.get_object("search?q=#{song.artist_name}&type=page")
    if search.any?
      fb_id = search.first['id']
      profile = graph.get_object("#{fb_id}?fields=about,record_label,likes,website,general_manager,genre,bio,name")
      song.facebook_likes = profile['likes']
      song.label_info = profile['record_label']
      song.artist_web_links = profile['website']
      song.general_manager = profile['genre']
      song.fb_profile_name = profile['name']
      song.fb_about = profile['about']
    end
  end
end