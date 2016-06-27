def spotify_user_playlist_search (userID, time_stamp, songs)
  latest_playlist = userID.playlists.first
  counter = 1

  latest_playlist.tracks.each do |track|
    t_id = Song.new
    t_id.playlist_source = latest_playlist.name
    t_id.track_name = track.name
    t_id.spotify_track_id = track.id
    t_id.artist_name = track.artists.first.name
    t_id.pos = counter
    counter += 1
    t_id.time_of_scraping = time_stamp.strftime("%A %B/%d/%Y")
    songs << t_id
  end

  songs.each do |song|
    spotify_artist = RSpotify::Artist.search("#{song.artist_name}")
    if spotify_artist.empty?
      song.spotify_popularity = "N/A"
      song.spotify_link = "N/A"
    else
      song.spotify_popularity = spotify_artist.last.popularity.to_s
      song.spotify_link = spotify_artist.last.external_urls['spotify']
    end
  end
end
