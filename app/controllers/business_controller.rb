class BusinessController < ApplicationController

	include HistoriesHelper

	include GraphHelper

	# GET /business
  def index
    is_logged_in
    #is_logged_in
   	@events = History.order("created_at DESC").limit(10)

    #ruby rails generate model
    # todo will need to get all the relevant models
  end


  
end