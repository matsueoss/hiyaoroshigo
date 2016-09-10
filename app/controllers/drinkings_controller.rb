class DrinkingsController < ApplicationController
  def show
    @drinking = Sake.find(params[:id])
  end

  def new
    @drinking = Drinking.new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(vote_params)
  end

  private
  
    def vote_params
      params.require(:vote).permit(:drinking_id, :score)
    end
end
