def facebook_search(songs)

  def facebook_check(facebook_field, song_data_var, profile, song)
    new_ song_data_var
    # if profile[facebook_field.to_s].nil?
    #   song.find{|i| i == "#{song_data_var}"} = "N/A"
    # else
    #   song.find{|i| i == "#{song_data_var}"} = profile[facebook_field]
    # end
  end

  songs.each do |song|
    graph = Koala::Facebook::API.new("#{ENV['FB_TOKEN']}")
    if graph.get_object("search?q=#{song.artist_name}&type=page").empty?
      song.artist_web_links = "N/A"
      song.label_info = "N/A"
      song.facebook_likes = "N/A"
      song.fb_genre = "N/A"
      song.fb_profile_name = "N/A"
      song.general_manager = "N/A"
      song.fb_about = "N/A"
    else
      search = graph.get_object("search?q=#{song.artist_name}&type=page")
      fb_id = search.first['id']
      profile = graph.get_object("#{fb_id}?fields=about,record_label,likes,website,general_manager,genre,bio,name")  
      facebook_check("likes", "facebook_likes", profile, song)
      facebook_check("record_label", "label_info", profile, song)
      facebook_check("website", "artist_web_links", profile, song)
      facebook_check("general_manager", "general_manager", profile, song)
      facebook_check("genre", "fb_genre", profile, song)
      facebook_check("name", "fb_profile_name", profile, song)
      facebook_check("about", "fb_about", profile, song)
    end
  end
end