class Song
  attr_accessor :artist_name, :track_name, :pos, :facebook_likes, :spotify_popularity, :label_info, 
                :general_manager, :fb_profile_name, :spotify_link, :artist_web_links, :fb_genre, 
                :chart_source, :playlist_source, :time_of_scraping, :spotify_track_id, :track_tempo,
                :spotify_track_dancibility, :spotify_track_instrumentalness, :spotify_track_positiveness

  def check_out
    puts "           Pos: #{@pos}"
    puts "   Artist Name: #{@artist_name}"
    puts "    Track Name: #{@track_name}"
    puts "Facebook Likes: #{@facebook_likes}"
  end

end