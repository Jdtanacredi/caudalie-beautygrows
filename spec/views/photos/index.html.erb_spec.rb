require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :instagram_id => "Instagram",
        :standard_url => "Standard Url",
        :thumb_url => "Thumb Url",
        :approved => false
      ),
      stub_model(Photo,
        :instagram_id => "Instagram",
        :standard_url => "Standard Url",
        :thumb_url => "Thumb Url",
        :approved => false
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Instagram".to_s, :count => 2
    assert_select "tr>td", :text => "Standard Url".to_s, :count => 2
    assert_select "tr>td", :text => "Thumb Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
