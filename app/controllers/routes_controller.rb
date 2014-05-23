class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  # GET /routes
  # GET /routes.json

  include RoutesHelper

  def index
    @routes = Route.where("is_deleted = false OR is_deleted IS NULL")
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
  end

  # GET /routes/new
  def new
    @route = Route.new
    @route.connections = Array.new
    @connections = Connection.all
  end

  # GET /routes/1/edit
  def edit
    @connections = Connection.all - @route.connections
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(route_params)
    new_connection = Array.new
    puts "\n\n\n\n------\n\n\n\n" + params[:route].to_s + " ahhhh  " + params[:route][:connection].to_s + ' oh well'
    new_connection.push(Connection.find(params[:route][:connection]))
    @route.connections << new_connection
    @route.save
    redirect_to edit_route_path(@route.id)
  end

  # PATCH/PUT /routes/1
  # PATCH/PUT /routes/1.json
  def update
    did_update = false

    respond_to do |format|
      connection_to_add =  Connection.find(params[:route][:connection])

      if connection_to_add.priority == @route.connections.first.priority

      common_ancestor = find_common_location_of_connections connection_to_add, @route.connections.last

      if is_not_duplicate? common_ancestor, @route.connections

      if @route.connections.count == 1 && is_connection_valid?(connection_to_add, @route.connections.last)
         @route.connections.push(connection_to_add)
         @route.update(route_params)
         did_update = true
      elsif @route.connections.count > 1
          puts "\n\n\n\n\n\n\n\n******\n\n\n\n" + (@route.connections[@route.connections.count-2]).to_s + "\n\n\n****"
           puts "\n\n\n\n\n\n\n\n******\n\n\n\n" + (@route.connections.last).to_s + "\n\n\n****"
          ancestor = find_common_location_of_connections(@route.connections.last, @route.connections[@route.connections.count-2])
          if is_connection_valid_given_location?(connection_to_add, ancestor) 
              @route.connections.push(connection_to_add)
              @route.update(route_params)
              did_update = true
          else
            puts "\n\n\n\n\**********\n\n\nAhh fuck"
          end
        end
      end
    end

      if did_update
        format.html { redirect_to edit_route_path(@route.id), notice: 'Route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' , notice: "Unable to update route, invalid connection selected. A route must be a path! No loops, connected connections etc." }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    puts "\n\nn\\n\n\n\nnahhhhhhhh"
    puts "\n\najffh: "  + (Mail.where("route_id = ? AND receive_date is NULL", @route.id).blank?).to_s
 

    if Mail.where("route_id = ? AND receive_date is NULL", @route.id).blank?
      @route[:is_deleted] = true
      @route.save
      respond_to do |format|
        format.html { redirect_to routes_url, notice: "Route successfully removed from use." }
      end
    else
      respond_to do |format|
          format.html { redirect_to @route, notice: "Unable to delete route - there is still mail travelling on it" }
      end 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:name)
    end
end
