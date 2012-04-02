require 'uri'
module Lots
  class Urlparser
    attr_accessor :status, :error,:raid
    def initialize url
      parsed = URI.parse(url)
      @error = ""
    case
    when parsed.host != 'www.kongregate.com'
      @status = :invalid
      @error << "wrong host "
    when parsed.path != '/games/5thPlanetGames/legacy-of-a-thousand-suns'
      @status = :invalid
      @error << "wrong path "
    when ! parsed.query.match(/kv_action_type=raidhelp&kv_difficulty=[0-9]&kv_hash=.+&kv_raid_boss=.+&kv_raid_id=[0-9]+/)
      @status = :invalid
      @error << "wrong query "
    else
      @status = :valid
    end
    find_raid parsed.query
    end
    def find_raid query
      name = query.scan(/boss=([a-z_]+)&/).flatten.first
      diff = query.scan(/difficulty=([0-9])&/).flatten.first.to_i - 1
      @raid = Raid.find_by_urlname_and_difficulty(name,diff)
    end
  end
end
