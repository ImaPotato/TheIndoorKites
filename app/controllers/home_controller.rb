class HomeController < ApplicationController

	def index
		is_logged_in

		@company = Company.all
		@notifications = History.where("mail_id > ? OR price_id > ? ",0,0).order("created_at DESC").limit(10)
		
		@companies = Array.new
		if params[:query] != '' && !params[:query].nil?
			@companies = Company.where("lower(company_name) like ? ", "#{params[:query]}%")
		end
	end

end