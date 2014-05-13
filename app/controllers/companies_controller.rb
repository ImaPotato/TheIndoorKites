class CompaniesController < ApplicationController

  def new
    @company = Company.new
    @companies = Array.new
  end

  def show
    @company = Company.find(params[:id])
    @companies = Company.search(params[:search]).page(params[:page]).per(10)
    render :template => 'companies/index'
  end

  def create
    @company = Company.new(get_params)
    if @company.save
      redirect_to transport_firm_path
    else
      redirect_to transport_firm_path
    end
  end

  def destroy
    Company.find(params[:id]).delete
    redirect_to root_url, :notice => 'logged out'
  end

  def index
    @company = Company.new
    @companies = Company.search(params[:search]).page(params[:page]).per(10)
  end

  def get_params
    params.require(:company).permit(:company, :to, :from, :weight_cost,
     :volume_cost, :max_weight, :max_volume, :duration, :frequency, :day,
     :utilized, :priority, :connection_id)
  end

  def clear_params
    params[:company] = nil
  end
end
