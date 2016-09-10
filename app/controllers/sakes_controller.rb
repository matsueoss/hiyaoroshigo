class SakesController < ApplicationController
  def index
    @sake = Sake.find(params[:id])
  end
end
