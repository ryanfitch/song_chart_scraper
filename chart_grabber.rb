require 'mechanize'
require 'rspotify'
require 'koala'
require 'dotenv'
require 'pry'
Dotenv.load
# load 'Gemfile'
load 'song.rb'
load 'spotify_search.rb'


songs = []
time_stamp = Time.now
RSpotify.authenticate("#{ENV['SPOTIFY_TOKEN']}", "#{ENV['SPOTIFY_SECRET']}")
userID = RSpotify::User.find('eshea89')


spotify_user_playlist_search(userID, time_stamp, songs)

pry(binding)