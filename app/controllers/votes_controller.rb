class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    debugger
    @vote = Vote.create(vote_params)
  end

  def edit
  end

  private
    
    def vote_params
      params.require(:vote).permit(:id, :score)  
    end
end
