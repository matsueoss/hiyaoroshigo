class DrinkingsController < ApplicationController
  before_action :set_drinking, only: [:show, :edit, :update, :destroy]

  # GET /drinkings
  # GET /drinkings.json
  def index
    @drinkings = Drinking.all
  end

  # GET /drinkings/1
  # GET /drinkings/1.json
  def show
  end

  # GET /drinkings/new
  def new
    @drinking = Drinking.new
  end

  # GET /drinkings/1/edit
  def edit
  end

  # POST /drinkings
  # POST /drinkings.json
  def create
    @drinking = Drinking.new(drinking_params)

    respond_to do |format|
      if @drinking.save
        format.html { redirect_to @drinking, notice: 'Drinking was successfully created.' }
        format.json { render :show, status: :created, location: @drinking }
      else
        format.html { render :new }
        format.json { render json: @drinking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinkings/1
  # PATCH/PUT /drinkings/1.json
  def update
    respond_to do |format|
      if @drinking.update(drinking_params)
        format.html { redirect_to @drinking, notice: 'Drinking was successfully updated.' }
        format.json { render :show, status: :ok, location: @drinking }
      else
        format.html { render :edit }
        format.json { render json: @drinking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinkings/1
  # DELETE /drinkings/1.json
  def destroy
    @drinking.destroy
    respond_to do |format|
      format.html { redirect_to drinkings_url, notice: 'Drinking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drinking
      @drinking = Drinking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drinking_params
      params.fetch(:drinking, {})
    end
end
