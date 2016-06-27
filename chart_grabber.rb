require 'mechanize'
require 'rspotify'
require 'koala'
require 'dotenv'
require 'pry'
Dotenv.load
# load 'Gemfile'
load 'spotify_search.rb'
load 'song.rb'


songs = []
userID = RSpotify::User.find('eshea89')

spotify_user_playlist_search(userID, songs)

spotify_audiofeatures_search(songs)

pry(binding)
