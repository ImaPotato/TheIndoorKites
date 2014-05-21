class HomeController < ApplicationController

	def index
		@company = Company.all
	end

	def show 
		if params[:query]
			@company = Company.search(params[:query])

		else
			@company =[]
		end
	end


end