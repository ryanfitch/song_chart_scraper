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
load 'constants.rb'

puts "Welcome to Chart/Playlist Song Data Grabber!"
puts "What would like to search?"
puts "Hit 1 for a SoundCloud Chart Search."
puts "Hit 2 for a Spotify Playlist Search by a user name."
puts "Hit 3 to quit."
playlist_or_chart = gets.chomp.to_i

case playlist_or_chart
when 1
  puts "SoundCloud Chart Search"

  SC_LINKS.each_with_index do |item, index|
    new_index = index + 1
    puts "Hit " + new_index.to_s + " for " + item.to_s.capitalize
  end

  puts "Which chart would you like to grab data for?"
  chart_answer = gets.chomp.to_i

  puts "Do you want the top 50 chart? Or the trending chart?"
  puts "1 - Top 50"
  puts "2 - Trending"
  chart_type_choice = gets.chomp.to_i
  
  case chart_type_choice
  when 1
    sc_kind = "top"
  when 2
    sc_kind = "trending"
  else
    puts "I didn't catch that"
  end

  songs = soundcloud_search(sc_kind, chart_answer-1)
  spotify_artist_search(songs)
  facebook_search(songs)

  puts "Hit 1 - See Chart Song Info"
  puts "Hit 2 - Export CSV File of Chart Song Info"
  output_choice = gets.chomp.to_i
  
  case output_choice
  when 1
    songs.each do |song|
      puts song.check_out
    end
  when 2
    make_soundcloud_csv(songs)
  end

# Begin Spotify Search
when 2
  puts "Latest Spotify Playlist Search"
  puts "Hit 1 - Latest playlist from user: eshea89 called Maimed & Tamed"
  puts "Hit 2 - Latest playlist from user: ryanfitch"
  puts "Hit 3 - Enter a different Spotify user"
  spotify_user = gets.chomp.to_i

  case spotify_user
  when 1
    user_name = 'eshea89'
  when 2
    user_name = 'ryanfitch'
  when 3
    puts "Latest Spotify search for which Spotify user name?"
    user_name = gets.chomp.to_s
  else
    puts "I didn't catch that"
  end

  songs = spotify_user_playlist_search(RSpotify::User.find(user_name))
  # facebook_search(songs)
  spotify_audiofeatures_search(songs)

  puts "Hit 1 - See Playlist Song Info"
  puts "Hit 2 - Export CSV File of Playlist Song Info"
  output_choice = gets.chomp.to_i

  case output_choice
  when 1
    songs.each do |song|
      puts song.check_out
    end
  when 2
    make_spotify_csv(songs)
  end

when 3
  puts "See ya!"
  # break
else
  puts "I didn't catch that"
  # return back to top question
end