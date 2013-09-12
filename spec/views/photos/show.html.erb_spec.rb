require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :instagram_id => "Instagram",
      :standard_url => "Standard Url",
      :thumb_url => "Thumb Url",
      :approved => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Instagram/)
    rendered.should match(/Standard Url/)
    rendered.should match(/Thumb Url/)
    rendered.should match(/false/)
  end
end
