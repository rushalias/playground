require 'haml'
require 'sinatra'

get '/time' do
"""

It's #{Time.now} at the server! 

"""
end

get '/xyz' do 
  @entries = [ "One", "Two", "3", "Four" ] 
  haml :idx
end

