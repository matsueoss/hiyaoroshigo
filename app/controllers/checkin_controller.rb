class CheckinController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
=begin
  def show
    @restaurants = Restaurant.all
  end
=end
end
