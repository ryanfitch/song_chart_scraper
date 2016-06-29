def soundcloud_search(songs, sc_kind, sc_link_pos)
  sc_links = ["", "all-music", "indie", "electronic", "rbsoul", "classical", "pop", "folksingersongwriter", "hiphoprap"]
  sc_link = sc_links[sc_link_pos]
  time_stamp = Time.now
  counter = 1
  response = HTTParty.get("https://api-v2.soundcloud.com/charts?kind=#{sc_kind}&genre=soundcloud:genres:#{sc_link}&client_id=#{ENV['SOUNDCLOUD_CLIENT_ID']}&offset=0&limit=50")
  response['collection'].each do |item|
    t_id = Song.new
    t_id.artist_name = item['track']['user']['username']
    t_id.track_name = item['track']['title']
    t_id.playlist_source = response['kind'].capitalize + " " + response['genre'].capitalize
    t_id.soundcloud_likes_count = item['track']['likes_count']
    t_id.soundcloud_playback_count = item['track']['playback_count']
    t_id.position = counter
    counter += 1
    t_id.time_of_scraping = time_stamp.strftime("%A %B/%d/%Y")
    songs << t_id
  end
end  