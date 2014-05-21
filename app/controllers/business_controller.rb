class BusinessController < ApplicationController


	# GET /business
  def index
    #is_logged_in
    all_events = History.all.compact
    @events = all_events.sort_by { |a,b| a.time <=> b.time }.take(20)

    #ruby rails generate model
    # todo will need to get all the relevant models
  end


  
end