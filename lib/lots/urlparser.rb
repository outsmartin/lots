require 'uri'
module Lots
  class Urlparser
    attr_accessor :status, :error
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
    end
  end
end
