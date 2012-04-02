require 'spec_helper'

describe "encounters/edit" do
  before(:each) do
    @encounter = assign(:encounter, stub_model(Encounter,
      :url => "MyString",
      :raid_id => 1,
      :health => "9.99"
    ))
  end

  it "renders the edit encounter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => encounters_path(@encounter), :method => "post" do
      assert_select "input#encounter_url", :name => "encounter[url]"
      assert_select "input#encounter_raid_id", :name => "encounter[raid_id]"
      assert_select "input#encounter_health", :name => "encounter[health]"
    end
  end
end
