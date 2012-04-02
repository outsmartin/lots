require 'lots/grabber'
include Lots
class Raid < ActiveRecord::Base
  has_many :encounters
  validates_uniqueness_of :name, :scope => [:difficulty]
  def self.fetch
    grabber
  end
  def self.import data
    data.each do |d|
      [1,1.25,1.6,2].each_with_index do |percent,diff|
        r = Raid.new
        r.name = d[:name]
        r.players = d[:players].to_i
        r.time = d[:time].to_i
        r.difficulty = diff
        r.urlname = d[:urlname]
        r.health = (d[:health].to_i * percent).to_i
        r.save
      end
    end
  end
  def to_s
    self.difficulty_humanized + ' ' + self.name
  end
  def difficulty_humanized
    case self.difficulty
    when 1
      diff = "Normal"
    when 2
      diff = "Hard"
    when 3
      diff = "Legendary"
    when 4
      diff = "Nightmare"
    else
      diff = "Special"
    end
    diff
  end

end
