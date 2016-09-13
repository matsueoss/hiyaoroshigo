class DrinkersController < ApplicationController
  before_action :authenticate_drinker!, only:[:edit, :show, :update]

  def redirector
    redirect_to '/drinker/auth/facebook?passcode='+params[:passcode]
  end

  def login

  end

  def edit
    @drinker = current_drinker
  end

  def show
    @drinker = current_drinker
  end

  def update
    drinker = current_drinker
    drinker.name = params[:drinker][:name]
    drinker.save
    redirect_to "/drinkers/edit"
  end
end
