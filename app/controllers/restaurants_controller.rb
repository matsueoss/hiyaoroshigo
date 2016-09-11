class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render html: @restaurant.name
  end

  def map
    @restaurants = Restaurant.all
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
