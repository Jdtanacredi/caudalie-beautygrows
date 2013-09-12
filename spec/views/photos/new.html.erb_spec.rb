require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :instagram_id => "MyString",
      :standard_url => "MyString",
      :thumb_url => "MyString",
      :approved => false
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#photo_instagram_id[name=?]", "photo[instagram_id]"
      assert_select "input#photo_standard_url[name=?]", "photo[standard_url]"
      assert_select "input#photo_thumb_url[name=?]", "photo[thumb_url]"
      assert_select "input#photo_approved[name=?]", "photo[approved]"
    end
  end
end
