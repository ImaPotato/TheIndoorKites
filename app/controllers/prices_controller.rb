class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]

   include HistoriesHelper

  # GET /prices
  # GET /prices.json
  def index
    is_logged_in
    @prices = Price.last
    if @prices.nil? 
      @prices = Price.new
    end
  end

  # GET /prices/
  # GET /prices/
  def show
    is_logged_in
    @price = Price.last
    redirect_to prices_path
  end

  # GET /prices/new
  def new
    is_logged_in
    @price = Price.new


  end

  # GET /prices/1/edit
  def edit
    is_logged_in
    @price = Price.last
  end

  # POST /prices
  def create
    is_logged_in
    @price = Price.new(price_params)
    respond_to do |format|
      if @price.save
         # add an row to the history table that a price has been added
        set_history(@price,HISTORY_EVENT_CREATED)
        format.html { redirect_to @price, notice: 'Price was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /prices/1
  def update
    is_logged_in
    @price = Price.new(price_params)
    respond_to do |format|
      if @price.save
        set_history(@price,HISTORY_EVENT_UPDATED)
        format.html { redirect_to @price, notice: 'Price was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /prices/1
  # this should probably never be called
  def destroy
    is_logged_in
    @price.destroy
    respond_to do |format|
      format.html { redirect_to prices_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_params
      params.require(:price).permit(:i_air_w_cost, :i_air_v_cost, :i_land_w_cost, :i_land_v_cost, :d_air_w_cost, :d_air_v_cost, :d_land_w_cost, :d_land_v_cost)
    end
end
