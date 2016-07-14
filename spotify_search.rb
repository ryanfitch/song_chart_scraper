RSpotify.authenticate(ENV['SPOTIFY_TOKEN'], ENV['SPOTIFY_SECRET'])

def spotify_user_playlist_search(user)
  puts "Grabbing song & artist data from Spotify..."
  latest_playlist = user.playlists.first
  songs = []

  latest_playlist.tracks.each_with_index do |track, index|
    song = Song.new
    song.playlist_source = latest_playlist.name
    song.track_name = track.name
    song.spotify_track_id = track.id
    song.artist_name = track.artists.first.name
    song.position = index + 1
    song.time_of_scraping = Time.now.strftime("%A %B/%d/%Y")
    songs << song
  end

  songs.each do |song|
    spotify_artist = RSpotify::Artist.search(song.artist_name)
    song.spotify_popularity = spotify_artist.last.popularity
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
  songs
end

def spotify_artist_search(songs)
  puts "Grabbing song & artist data from Spotify..."
  songs.each do |song|
    spotify_artist = RSpotify::Artist.search(song.artist_name)
    if spotify_artist.any?
      song.spotify_popularity = spotify_artist.last.popularity
      song.spotify_link = spotify_artist.last.external_urls['spotify']
    end
  end
  songs
end
