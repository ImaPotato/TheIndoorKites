class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  # GET /prices
  # GET /prices.json
  def index
    @prices = Price.last
    if @prices.nil? 
      @prices = Price.new
    end
  end

  # GET /prices/
  # GET /prices/
  def show
    @price = Price.last
    redirect_to prices_path
  end

  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
    @price = Price.last
  end

  # POST /prices
  def create
    @price = Price.new(price_params)

    respond_to do |format|
      if @price.save
        format.html { redirect_to @price, notice: 'Price was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /prices/1
  def update
    price = Price.new(price_params)
    respond_to do |format|
      if price.save
        format.html { redirect_to @price, notice: 'Price was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /prices/1
  # this should probably never be called
  def destroy
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
