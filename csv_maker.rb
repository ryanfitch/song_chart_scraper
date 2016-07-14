
def make_soundcloud_csv(songs)
  csv_filename = songs.first.chart_source + "-" + Time.now.strftime("%B-%d-%Y") + ".csv"
  CSV.open('#{csv_filename}', 'wb') do |row|
    row << SOUNDCLOUD_CHART_HEADERS
    songs.each do |item|
      song_attrs = [
        item.position, item.artist_name, item.track_name, item.facebook_likes, item.spotify_popularity, item.label_info,
        item.general_manager, item.fb_profile_name, item.artist_web_links, item.spotify_link, item.fb_genre,
        item.soundcloud_likes_count, item.soundcloud_likes_count, item.soundcloud_playback_count, item.chart_source,
        item.time_of_scraping
        ]
      row << song_attrs
    end
  end
end

def make_spotify_csv(songs)
  playlist_name = songs.first.playlist_source
  csv_filename = "#{playlist_name}-" + Time.now.strftime("%B-%d-%Y") + ".csv"
  CSV.open("#{csv_filename}", 'wb') do |row|
    row << SPOTIFY_PLAYLIST_HEADERS
    songs.each do |item|
      song_attrs = [
        item.position, item.artist_name, item.track_name, item.facebook_likes, item.spotify_popularity,
        item.label_info, item.general_manager, item.fb_profile_name, item.artist_web_links, item.spotify_link,
        item.fb_genre, item.track_tempo, item.spotify_track_dancibility, item.spotify_track_instrumentalness,
        item.spotify_track_positiveness, item.chart_source, item.time_of_scraping
        ]
      row << song_attrs
    end
  end
end
