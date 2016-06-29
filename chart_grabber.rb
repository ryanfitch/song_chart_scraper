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

songs = []


# userID = RSpotify::User.find('eshea89')
# spotify_user_playlist_search(userID, songs)
# spotify_audiofeatures_search(songs)
# facebook_search(songs)


soundcloud_search(songs, "top", 1)
# spotify_gen_info_search(songs)
# facebook_search(songs)
pry(binding)

