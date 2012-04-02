class Encounter < ActiveRecord::Base
  belongs_to :raid
  validates_uniqueness_of :url
  validates :url,:format => { :with => /http:\/\/www.kongregate.com\/games\/5thPlanetGames\/legacy-of-a-thousand-suns\?kv_action_type=raidhelp&kv_difficulty=[0-9]&kv_hash=.+&kv_raid_boss=.+&kv_raid_id=[0-9]+/, message: "Valid Kongregate URL needed!" }

  def raid_name
    self.raid.to_s
  end
end
