require 'mechanize'
require 'rspotify'
require 'koala'
require 'dotenv'
require 'pry'
Dotenv.load
# require_relative 'Gemfile'
require_relative 'song'


songs = []
time_stamp = Time.now
RSpotify.authenticate("#{ENV['SPOTIFY_TOKEN']}", "#{ENV['SPOTIFY_SECRET']}")
userID = RSpotify::User.find('eshea89')
latest_playlist = userID.playlists.first
counter = 1
latest_playlist.tracks.each do |track|
  t_id = Song.new
  t_id.playlist_source = latest_playlist.name
  t_id.track_name = track.name
  t_id.spotify_track_id = track.id
  t_id.artist_name = track.artists.first.name
  t_id.pos = counter
  t_id.time_of_scraping = time_stamp.strftime("%A %B/%d/%Y")
  songs << t_id
end




pry(binding)

# song_data['ARTISTS'].each do |artist|
#   spot_artists = RSpotify::Artist.search("#{artist}")
#   if spot_artists.empty?
#     song_data['SPOTIFY POPULARITY(s)'] << "N/A"
#     song_data['SPOTIFY LINK'] << "N/A"
#   else
#     spot_artist << spot_artists.first
#     song_data['SPOTIFY POPULARITY(s)'] << spot_artist.last.popularity.to_s
#     song_data['SPOTIFY LINK'] << spot_artist.last.external_urls['spotify']
#   end
# end


  
  # time_stamp = Time.now
  # counter = 1

  # latest_playlist.tracks.each do |track|
  #   song_data['PLAYLIST NAME'] << latest_playlist.name
  #   song_data['TRACKS'] << track.name
  #   song_data['SPOTIFY TRACK ID'] << track.id
  #   song_data['ARTISTS'] << track.artists.first.name
  #   song_data['POS'] << counter
  #   counter += 1
  #   song_data['TIME OF SONG DATA SCRAPING'] << time_stamp.strftime("%A %B/%d/%Y")
  # end
