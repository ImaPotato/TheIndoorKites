class HomeController < ApplicationController

	def index
		@company = Company.all
		@notifications = History.where("mail_id > ? OR price_id > ? ",0,0).order("created_at DESC").limit(10)
		
	end

	def show 
		if params[:query]
			@company = Company.search(params[:query])

		else
			@company =[]
		end
	end


end