require 'lots/urlparser'
module Lots
  describe Urlparser do
    it "should accept valid kong url" do
      url = 'http://www.kongregate.com/games/5thPlanetGames/legacy-of-a-thousand-suns?kv_action_type=raidhelp&kv_difficulty=4&kv_hash=920ZfjE74d&kv_raid_boss=carnus&kv_raid_id=2524547'
      parser = Urlparser.new(url)
      p parser.error
      parser.status.should be :valid

    end
    it "should not accept invalid urls" do

      File.readlines('spec/assets/wrongurls').each_with_index do |url,i|
        parse = Urlparser.new(url)
        p i
        parse.status.should == :invalid
      end

    end
  end
end
