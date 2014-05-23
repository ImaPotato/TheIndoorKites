class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :is_logged_in_manager?
  prepend_before_filter :email_to_downcase, :only => [:create, :update]



  private

  def email_to_downcase
    if params[:user] && params[:user][:email]
      params[:user][:email] = params[:user][:email].downcase
    end
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in
    logged_in = true
    if !session[:user_id].present?
      logged_in = false;
      redirect_to log_in_path
    end
    logged_in
  end

  # create a new row in the history table with the event that 
  # occurred (eg a company was added)
  # also pass in an action that occured, something like updated or created
  # a string
  def set_history(event, action)
    puts action
    history = History.new
    isValidEvent = true
    case event.class.name
      when "Company"
        history[:company_id] = event[:id] 
      when "Mail"
        history[:mail_id] = event[:id]
      when "Connection"
        history[:connection_id] = event[:id]
      when "Location"
        history[:location_id] = event[:id]
      when "Price"
        history[:price_id] = event[:id]
      else 
        isValidEvent = false;
    end
    if isValidEvent
      # if it's valid construct the pretty string formatted date time
      history[:event_time] = string_for_event_time(event[:created_at])
      # such coupling, much wow
      history[:event_details] = history.get_event_description(event, action)
      history[:event_type] = event.class.name
      history.save
    end 
  end
end
