def soundcloud_search(sc_kind, sc_link_pos)
  puts "Grabbing chart data from Soundcloud..."
  sc_link = SC_LINKS[sc_link_pos]
  songs = []
  response = HTTParty.get("https://api-v2.soundcloud.com/charts?kind=#{sc_kind}&genre=soundcloud:genres:#{sc_link}&client_id=#{ENV['SOUNDCLOUD_CLIENT_ID']}&offset=0&limit=50")
  response['collection'].each_with_index do |item, index|
    song = Song.new
    song.artist_name = item['track']['user']['username']
    song.track_name = item['track']['title']
    song.chart_source = response['kind'].capitalize + " " + response['genre'].capitalize
    song.soundcloud_likes_count = item['track']['likes_count']
    song.soundcloud_playback_count = item['track']['playback_count']
    song.position = index + 1
    song.time_of_scraping = Time.now.strftime("%A %B/%d/%Y")
    songs << song
  end
  songs
end