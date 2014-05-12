class CompaniesController < ApplicationController

  def new
    @company = Company.new
    @companies = Array.new
  end

  def create
    @company = Company.new(get_params)
    if @company.save
      redirect_to transport_firm_path
    end
  end

  def index
      @company = Company.new
      @companies = Company.search(params[:search])
  end

  def get_params
    params.require(:company).permit(:company, :to, :from, :weight_cost,
     :volume_cost, :max_weight, :max_volume, :duration, :frequency, :day,
     :utilized, :priority, :connection_id)
  end
end
