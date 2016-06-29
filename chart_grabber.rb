require 'mechanize'
require 'rspotify'
require 'koala'
require 'dotenv'
require 'pry'
require 'httparty'
Dotenv.load
load 'spotify_search.rb'
load 'facebook_search.rb'
load 'song.rb'
load 'soundcloud_search.rb'

songs = []


# userID = RSpotify::User.find('eshea89')
# spotify_user_playlist_search(userID, songs)
# spotify_audiofeatures_search(songs)
# facebook_search(songs)


soundcloud_search(songs)
spotify_gen_info_search(songs)
facebook_search(songs)
pry(binding)

