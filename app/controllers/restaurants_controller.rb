class RestaurantsController < ApplicationController
  before_action :authenticate_drinker!

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    if request.xhr?
      render partial: "show", locals: { restaurant: @restaurant }
    end
  end

  def map
    @restaurants = Restaurant.all
    @restaurant =
      current_drinker.latest_checkin&.restaurant ||
      current_drinker.ticket&.restaurant ||
      Restaurant.first
    @markers = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.picture({
        url: "/assets/sake#{restaurant.congestion_degree}.png",
        width: 32,
        height: 32
      })
      # max = restaurant.tickets.count
      # current = 
      #   restaurant.checkins.where("created_at > ?", 60.minutes.ago).count
      # marker.infowindow "#{restaurant.name} (#{current}/#{max})"
      marker.title restaurant.id.to_s
    end
  end
end
