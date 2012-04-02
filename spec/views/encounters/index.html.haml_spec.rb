require 'spec_helper'

describe "encounters/index" do
  before(:each) do
    assign(:encounters, [
      stub_model(Encounter,
        :url => "Url",
        :raid_id => 1,
        :health => "9.99"
      ),
      stub_model(Encounter,
        :url => "Url",
        :raid_id => 1,
        :health => "9.99"
      )
    ])
  end

  it "renders a list of encounters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
