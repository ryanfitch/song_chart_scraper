require 'mechanize'
require 'httparty'
require 'rspotify'
require 'dotenv'
require 'koala'
require 'pry'
Dotenv.load
load 'song.rb'
load 'soundcloud_search.rb'
load 'facebook_search.rb'
load 'spotify_search.rb'


# userID = RSpotify::User.find('eshea89')
# spotify_user_playlist_search(userID, songs)
# spotify_audiofeatures_search(songs)
# facebook_search(songs)


# soundcloud_search(songs, "top", 1)
# spotify_gen_info_search(songs)
# facebook_search(songs)
# pry(binding)

puts "Welcome to Chart/Playlist Song Data Grabber!"
puts "What would like to search?"
puts "Hit 1 for a SoundCloud Chart Search."
puts "Hit 2 for a Spotify Playlist Search by a user name."
ans1 = gets.chomp.to_i
if ans1 == 1
  puts "SoundCloud Chart Search"
  puts "1 - Indie"
  puts "2 - Electronic"
  puts "3 - RB Soul"
  puts "4 - Classical"
  puts "5 - Pop"
  puts "6 - Folk Singer Songwriter"
  puts "7 - Hiphop"
  puts "Which chart would you like to grab data for?"
  ans2 = gets.chomp.to_i
  puts "Do you want the top 50 chart? Or the trending chart?"
  puts "1 - Top 50"
  puts "2 - Trending"
  ans3 = gets.chomp.to_i
  if ans3 == 1
    sc_kind = "top"
  elsif ans3 == 2
    sc_kind = "trending"
  else
    puts "I didn't catch that"
  end
  songs = soundcloud_search(sc_kind, ans3)
  spotify_gen_info_search(songs)
  facebook_search(songs)
  songs.each do |song|
    puts song.check_out
  end
else
  puts "not 1"
end