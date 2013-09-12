class Photo < ActiveRecord::Base
  resourcify

  attr_accessible :approved, :instagram_id, :standard_url, :thumb_url
end
