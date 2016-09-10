class DrinkersController < ApplicationController
  before_action :authenticate_drinker!

  def edit
    @drinker = current_drinker
  end

  def show
    @drinker_name = current_drinker.name
  end

  def update
    p params[:drinker][:name]
    drinker = current_drinker
    drinker.name = params[:drinker][:name]
    drinker.save
    redirect_to :action => "show"
  end
end
