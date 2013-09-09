class HomeController < ApplicationController
  def index
    # @instagram = Instagram.user_recent_media("23472277", {:count => 5})
    @instagram = Instagram.tag_recent_media('awesome')
  end
end
