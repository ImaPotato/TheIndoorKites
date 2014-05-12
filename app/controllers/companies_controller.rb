class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(get_params)
    if @company.save
      redirect_to homepage_path
    end
  end

  def get_params
    params.require(:company).permit(:company, :to, :from, :weight_cost,
     :volume_cost, :max_weight, :max_volume, :duration, :frequency, :day,
     :utilized, :priority, :connection_id)
  end

  def get_company_by_id(id)
    Company.find(:id => id)
  end

  def get_all_connection_by_start(start)
    Company.find(:all, conditions =>{ :to => start})
  end

  def get_all_connection_by_destination(destination)
    Company.find(:all, conditions =>{ :from => destination})
  end

  def get_all_companies_by_name(name)
    Company.find(:all, conditions => { :company => name})
  end

  # @return [Company]
  def get_all_companies
    Company.all
  end
end
