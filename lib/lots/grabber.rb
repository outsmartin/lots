require 'nokogiri'
require 'open-uri'
require 'json'
module Lots
  ALLIANCE = 'http://zoywiki.com/index.php/LotS/raids/alliance'
  GENERAL = 'http://zoywiki.com/index.php/LotS/raids/general'
  DATAPATH = 'lib/lots/data.json'
  def grabber
   data = JSON.parse open(DATAPATH).read
   data.map do |d|
    i = d[1]
    name = i["name"]
    urlname = i["id"]
    players = i["size"]
    health = i["health"]
    time = i["duration"]
      {
        name: name,
        players: players,
        time: time,
        urlname: urlname,
        health: health
      }
    end
  end
end
