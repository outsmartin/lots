require 'lots/grabber'
class Raid < ActiveRecord::Base
  include Lots
  def fetch
    data = grabber
  end
  def self.import data
    data.each do |d|
      d[:health].each do |hash|
        r = Raid.new
        r.name = d[:name]
        r.type = d[:type]
        r.players = d[:players].split(':')[1].strip
        r.time = d[:time].split(':')[1].strip
        r.url = d[:url]
        r.difficulty = hash.first.first
        r.health = hash.first[1].gsub(',','').to_i
        r.save
      end
    end
  end
end
