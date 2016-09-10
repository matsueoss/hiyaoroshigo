class CheckinsController < ApplicationController
  def new
    @checkin = Checkin.new
    @restaurants = Restaurant.all
  end

  def create
    restaurant_id = params[:restaurant][:id]
    render text: "#{Restaurant.find(restaurant_id).name}にチェックイン"
  end
end
