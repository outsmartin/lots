require 'spec_helper'
describe Raid do
  data = [{:name=>"CC Commander", :type=>"Normal", :players=>"Max Players: 10", :time=>"Time Limit: 168 hours", :url=>"http://zoywiki.com/index.php/LotS/raids/general/CC_Commander", :health=>[{"Normal"=>"150,000"}, {"Hard"=>"187,500"}, {"Legendary"=>"240,000"}, {"Nightmare"=>"300,000"}]}, {:name=>"Centurian Void Killer", :type=>"Normal", :players=>"Max Players: 50", :time=>"Time Limit: 168 hours", :url=>"http://zoywiki.com/index.php/LotS/raids/general/Centurian_Void_Killer", :health=>[{"Normal"=>"5,000,000"}, {"Hard"=>"6,250,000"}, {"Legendary"=>"8,000,000"}, {"Nightmare"=>"10,000,000"}]}]

  it "should import data correctly" do
    Raid.import data

    Raid.count.should > 7
  end
end
