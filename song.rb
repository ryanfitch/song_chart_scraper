class Song
  attr_accessor :artist_name, :track_name, :position, :facebook_likes, :spotify_popularity, :label_info, :fb_about,
                :general_manager, :fb_profile_name, :spotify_link, :artist_web_links, :fb_genre, 
                :chart_source, :playlist_source, :time_of_scraping, :spotify_track_id, :track_tempo,
                :spotify_track_dancibility, :spotify_track_instrumentalness, :spotify_track_positiveness,
                :soundcloud_likes_count, :soundcloud_playback_count, 

  def check_out
    puts "      Position: #{@position}"
    puts "   Artist Name: #{@artist_name}"
    puts "    Track Name: #{@track_name}"
    puts "Facebook Likes: #{@facebook_likes}"
  end

end