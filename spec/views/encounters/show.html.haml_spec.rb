require 'spec_helper'

describe "encounters/show" do
  before(:each) do
    @encounter = assign(:encounter, stub_model(Encounter,
      :url => "Url",
      :raid_id => 1,
      :health => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/1/)
    rendered.should match(/9.99/)
  end
end
