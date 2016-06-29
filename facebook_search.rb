def facebook_search(songs)

  songs.each do |song|
    graph = Koala::Facebook::API.new("#{ENV['FB_TOKEN']}")
    search = graph.get_object("search?q=#{song.artist_name}&type=page")
    if search.empty?
      song.facebook_likes = nil
      song.label_info = nil
      song.artist_web_links = nil
      song.general_manager = nil
      song.fb_profile_name = nil
      song.fb_about = nil
    else
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