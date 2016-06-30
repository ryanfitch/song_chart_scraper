RSpotify.authenticate("#{ENV['SPOTIFY_TOKEN']}", "#{ENV['SPOTIFY_SECRET']}")


def spotify_user_playlist_search (userID)
  puts "Grabbing song & artist data from Spotify..."
  latest_playlist = userID.playlists.first
  time_stamp = Time.now
  counter = 1
  songs = []

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
    song.spotify_popularity = spotify_artist.last.popularity.to_s
    song.spotify_link = spotify_artist.last.external_urls['spotify']
  end
  songs
end


def spotify_audiofeatures_search(songs)
  songs.each do |song|
    audio_features = RSpotify::AudioFeatures.find(song.spotify_track_id)
    song.track_tempo = audio_features.tempo.to_s
    song.spotify_track_dancibility = audio_features.danceability.to_s
    song.spotify_track_instrumentalness = audio_features.instrumentalness.to_s
    song.spotify_track_positiveness = audio_features.valence.to_s
  end
end

def spotify_gen_info_search(songs)
  puts "Grabbing song & artist data from Spotify..."
  songs.each do |song|
    spotify_artist = RSpotify::Artist.search("#{song.artist_name}")
    if spotify_artist.any?
      song.spotify_popularity = spotify_artist.last.popularity.to_s
      song.spotify_link = spotify_artist.last.external_urls['spotify']
    end
  end
end
