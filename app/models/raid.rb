require 'lots/grabber'
include Lots
class Raid < ActiveRecord::Base
  belongs_to :action
  validates_uniqueness_of :name, :scope => [:difficulty]
  def self.fetch
    grabber
  end
  def self.import data
    data.each do |d|
      d[:health].each do |hash|
        r = Raid.new
        r.name = d[:name]
        r.category = d[:type]
        r.players = d[:players].to_i
        r.time = d[:time].to_i
        r.url = d[:url]
        r.difficulty = hash.first.first
        r.health = hash.first[1].gsub(',','').to_i
        r.save
      end
    end
  end
end
