class PricesController < ApplicationController
	def new
	end


	def index
		
	end

	def create
		redirect_to prices_path
	end

	def get_prices
		Prices.all
	end
end
