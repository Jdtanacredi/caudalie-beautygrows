class HomeController < ApplicationController
  def index
    @instagram = Instagram.user_recent_media("23472277", {:count => 5})
  end
end
