class CompanyController < ApplicationController

  helper_method :create_new_company, :get_companies

  def new
    @company = Company.new
    @list_of_companies ||= Array.new
    @list_of_companies.push(Company.new)
  end

  def create_new_company
    create()
    Company.new
  end

  def get_companies
    @list_of_companies
  end

  def create
    @list_of_companies.push(Company.new)
  end
end
