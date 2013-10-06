class Photo < ActiveRecord::Base
  resourcify

  attr_accessible :approved, :instagram_id, :standard_url, :thumb_url, 
    :caption_text, :user_username, :user_full_name, :user_profile_picture
end
