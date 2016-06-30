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
load 'csv_maker.rb'





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
  # facebook_search(songs)
  puts "Hit 1 - See Chart Song Info"
  puts "Hit 2 - Export CSV File of Chart Song Info"
  answer7 = gets.chomp.to_i
  if answer7 == 1
    songs.each do |song|
      puts song.check_out
    end
  elsif answer7 == 2
    make_soundcloud_csv(SOUNDCLOUD_CHART_HEADERS, songs)
  end


else
  puts "Latest Spotify Playlist Search"
  puts "Hit 1 - Latest playlist from user: eshea89 called Maimed & Tamed"
  puts "Hit 2 - Latest playlist from user: ryanfitch"
  puts "Hit 3 - Enter a different Spotify user"
  answer5 = gets.chomp.to_i
  if answer5 == 1
    userID = RSpotify::User.find('eshea89')
    songs = spotify_user_playlist_search(userID)
    spotify_audiofeatures_search(songs)
    # facebook_search(songs)
  elsif answer5 == 2
    userID = RSpotify::User.find('ryanfitch')
    songs = spotify_user_playlist_search(userID)
    spotify_audiofeatures_search(songs)
    # facebook_search(songs)
  elsif answer5 == 3
    puts "Latest Spotify search for which Spotify user name?"
    answer6 = gets.chomp.to_s
    userID = RSpotify::User.find("#{answer6}")
    songs = spotify_user_playlist_search(userID)
    spotify_audiofeatures_search(songs)
    # facebook_search(songs)
  else
    puts "I didn't catch that."
  end
  puts "Hit 1 - See Playlist Song Info"
  puts "Hit 2 - Export CSV File of Playlist Song Info"
  answer8 = gets.chomp.to_i
  if answer8 == 1
    songs.each do |song|
      puts song.check_out
    end
  elsif answer8 == 2
    make_spotify_csv(SPOTIFY_PLAYLIST_HEADERS, songs)
  end
end