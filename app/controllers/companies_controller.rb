class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  include HistoriesHelper

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @priorities = Priority.all
  end

  # GET /companies/1/edit
  def edit
    @priorities = Priority.all
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        # add an row to the history table that a company has been added
        set_history(@company,HISTORY_EVENT_CREATED)
        
        @company.connections.each do |connection|
          if connection.location_one_drop_down.blank?
            if !Location.where(name: connection.location_one).exists?
              new_location = Location.new(:name => connection.location_one)
              new_location.save
			        set_history(new_location,HISTORY_EVENT_CREATED)
            end
          else
            connection.location_one = connection.location_one_drop_down
          end
          if connection.location_two_drop_down.blank?
            if !Location.where(name: connection.location_two).exists?
              new_location = Location.new(:name => connection.location_two)
              new_location.save
              set_history(new_location,HISTORY_EVENT_CREATED)
            end
          else
            connection.location_two = connection.location_two_drop_down
          end
          # add a history event for that connection
          set_history(connection,HISTORY_EVENT_CREATED)
        end

        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        set_history(@company,HISTORY_EVENT_UPDATE)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:company_name, connections_attributes:
        [:id, :_destroy, :location_one, :location_one_drop_down, :location_two, :location_two_drop_down, :weight_cost, :volume_cost, :max_weight, :max_volume, :duration, :frequency, :priority, :day, :utilised, locations_attributes: [:id, :name]
        ]
    )
  end
end
