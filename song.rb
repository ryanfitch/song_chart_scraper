class Song
  attr_accessor :artist_name, :track_name, :position, :facebook_likes, :spotify_popularity, :label_info, :fb_about,
                :general_manager, :fb_profile_name, :spotify_link, :artist_web_links, :fb_genre, 
                :chart_source, :playlist_source, :time_of_scraping, :spotify_track_id, :track_tempo,
                :spotify_track_dancibility, :spotify_track_instrumentalness, :spotify_track_positiveness,
                :soundcloud_likes_count, :soundcloud_playback_count


  def check_out
    "              Chart Source: #{self.chart_source}\n          Time Of Scraping: #{self.time_of_scraping}\n                  Position: #{self.position}\n               Artist Name: #{self.artist_name}\n                Track Name: #{self.track_name}\n            Facebook Likes: #{self.facebook_likes}\n    Soundcloud Likes Count: #{self.soundcloud_likes_count}\n Soundcloud Playback Count: #{self.soundcloud_playback_count}\n        Spotify Popularity: #{self.spotify_popularity}\n                Label Info: #{self.label_info}\n            Facebook About: #{self.fb_about}\n           General Manager: #{self.general_manager}\n              Spotify Link: #{self.spotify_link}\n          Artist Web Links: #{self.artist_web_links}\n           Genre (from FB): #{self.fb_genre}\n Spotify Track Dancibility: #{self.spotify_track_dancibility}\nSpotify Track Positiveness: #{self.spotify_track_positiveness}\n" + "+"*80
  end

end