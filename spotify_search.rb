RSpotify.authenticate("#{ENV['SPOTIFY_TOKEN']}", "#{ENV['SPOTIFY_SECRET']}")


def spotify_user_playlist_search (userID, songs)
  latest_playlist = userID.playlists.first
  time_stamp = Time.now
  counter = 1

  latest_playlist.tracks.each do |track|
    t_id = Song.new
    t_id.playlist_source = latest_playlist.name
    t_id.track_name = track.name
    t_id.spotify_track_id = track.id
    t_id.artist_name = track.artists.first.name
    t_id.position = counter
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


def spotify_audiofeatures_search(songs)
  songs.each do |song|
    audio_features = RSpotify::AudioFeatures.find(song.spotify_track_id)
    if audio_features.tempo.nil?
      song.tempo = "N/A"
    else
      song.track_tempo = audio_features.tempo.to_s
    end
    if audio_features.danceability.nil?
      song.spotify_track_dancibility = "N/A"
    else
      song.spotify_track_dancibility = audio_features.danceability.to_s
    end
    if audio_features.instrumentalness.nil?
      song.spotify_track_instrumentalness = "N/A"
    else
      song.spotify_track_instrumentalness = audio_features.instrumentalness.to_s
    end
    if audio_features.valence.nil?
      song.spotify_track_positiveness = "N/A"
    else
      song.spotify_track_positiveness = audio_features.valence.to_s
    end
  end
end