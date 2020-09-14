class StaticPagesController < ApplicationController
  def home
    render "static_pages/home/#{current_user_type.downcase}"
  end
end
