require 'rubygems'
require 'sinatra'
require 'haml'
require 'json'
 

get '/recommendation/video/:videoid' do |videoid|
    headers     "Content-Type"   => "application/json"
    status      set_status( videoid.to_i )
    body        genjson( videoid.to_i, '-1' )
end

get '/recommendation/video/:videoid/guest/:guestid' do |videoid,guestid|
    headers     "Content-Type"   => "application/json"
    status      set_status( videoid.to_i )
    body        genjson( videoid.to_i, guestid )
end

get '/recommendation/game/:gameid' do |gameid|

    headers     "Content-Type"   => "application/json"
    status      set_status( gameid.to_i )
    body        genjson( gameid.to_i, '-1' )
end

get '/recommendation/game/:gameid/guest/:guestid' do |gameid,guestid|

    headers     "Content-Type"   => "application/json"
    status      set_status( gameid.to_i )
    body        genjson( gameid.to_i, guestid )
end


get '/recommendation/game' do
  content_type :json
  {"params" => params}.to_json

  # http://localhost:4567/recommendation/game?p1=one&p2=two  
  # {
  # 	"params": {
  # 		"p1": "one",
  # 		"p2": "two"
  #      }
  # }
end

# not_found do
# 	'This is nowhere to be found.'
# end


def set_status(vid)
    retval = 200
    if vid >= 400 && vid < 500 
        retval = 404
    elsif vid >= 500 
        retval = 500
    end 
    return retval
end


def genjson(id, guestid)
    JSON.pretty_generate( 
    {
        "total" => 4,
        "offset" => 2,
        "mediaid" => id, 
        "guestid" => guestid,
        "recommendations" => [ 
            { "id" => 1000001 + id, "type" => "video" }, 
            { "id" => 1000002 + id, "type" => "video" }, 
            { "id" => 1000003 + id, "type" => "game" }, 
            { "id" => 1000004 + id, "type" => "video" }]
    }
    )
end 
