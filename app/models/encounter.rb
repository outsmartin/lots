class Encounter < ActiveRecord::Base
  belongs_to :raid
  validates_uniqueness_of :url
  validates_presence_of :url
  validates_presence_of :health
  validates_presence_of :started_at
  validates :url,:format => { :with => /http:\/\/www.kongregate.com\/games\/5thPlanetGames\/legacy-of-a-thousand-suns\?kv_action_type=raidhelp&(kv_difficulty=[0-9]&kv_hash=.+&kv_raid_boss=.+&kv_raid_id=[0-9]+|kv_raid_id=[0-9]+&kv_difficulty=[0-9]&kv_raid_boss=.+)/, message: "Valid Kongregate URL needed!" }

  def raid_name
    self.raid.to_s
  end
  def to_s
    raid_name
  end
  def time_left
    hours = ((started_at + raid.time.hours - Time.now) / 3600.0).round
    if hours > 0
      string = hours.to_s + " h"
    else
      string = "Raid Expired"
    end
    string
  end
  def raid_players
    self.raid.players
  end
  def name
    self.raid.name
  end
end
