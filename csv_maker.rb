SOUNDCLOUD_CHART_HEADERS = [
  "CHART POS",
  "ARTIST",
  "TRACK",
  "FACEBOOK LIKES",
  "SPOTIFY POPULARITY",
  "LABEL INFO FROM FB",
  "GENERAL MANAGER INFO FROM FB",
  "PROFILE NAME FROM FB",
  "ARTIST WEBSITE LINKS",
  "SPOTIFY ARTIST LINK",
  "GENRE FROM FB",
  "SOUNDCLOUD LIKES COUNT",
  "SOUNDCLOUD PLAYBACK COUNT",
  "SOUNDCLOUD CHART SOURCE",
  "TIME OF SONG DATA SCRAPING"
]

SPOTIFY_PLAYLIST_HEADERS = [
  "SONG POS",
  "ARTIST",
  "TRACK",
  "FACEBOOK LIKES",
  "SPOTIFY POPULARITY",
  "LABEL INFO FROM FB",
  "GENERAL MANAGER INFO FROM FB",
  "PROFILE NAME FROM FB",
  "ARTIST WEBSITE LINKS",
  "SPOTIFY ARTIST LINK",
  "GENRE FROM FB",
  "TRACK TEMPO",
  "TRACK DANCIBILITY SCORE",
  "TRACK INSTRUMENTALNESS SCORE",
  "TRACK POSITIVENESS SCORE",
  "SPOTIFY PLAYLIST SOURCE",
  "TIME OF SONG DATA SCRAPING"
]

def make_soundcloud_csv(headers, songs)
  CSV.open('data.csv', 'wb') do |row|
    row << headers
    songs.each do |item|
      song_attrs = []
      song_attrs << item.position
      song_attrs << item.artist_name
      song_attrs << item.track_name
      song_attrs << item.facebook_likes
      song_attrs << item.spotify_popularity
      song_attrs << item.label_info
      song_attrs << item.general_manager
      song_attrs << item.fb_profile_name
      song_attrs << item.artist_web_links
      song_attrs << item.spotify_link
      song_attrs << item.fb_genre
      song_attrs << item.soundcloud_likes_count
      song_attrs << item.soundcloud_playback_count
      song_attrs << item.chart_source
      song_attrs << item.time_of_scraping
      row << song_attrs
    end
  end
end

def make_spotify_csv(headers, songs)
  CSV.open('data.csv', 'wb') do |row|
    row << headers
    songs.each do |item|
      song_attrs = []
      song_attrs << item.position
      song_attrs << item.artist_name
      song_attrs << item.track_name
      song_attrs << item.facebook_likes
      song_attrs << item.spotify_popularity
      song_attrs << item.label_info
      song_attrs << item.general_manager
      song_attrs << item.fb_profile_name
      song_attrs << item.artist_web_links
      song_attrs << item.spotify_link
      song_attrs << item.fb_genre
      song_attrs << item.tempo
      song_attrs << item.spotify_track_dancibility
      song_attrs << item.spotify_track_instrumentalness
      song_attrs << item.spotify_track_positiveness
      song_attrs << item.chart_source
      song_attrs << item.time_of_scraping
      row << song_attrs
    end
  end
end