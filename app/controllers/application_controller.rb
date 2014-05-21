class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
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
  def set_history(event)
    logger.debug "\n\n\nEvent is type " + event.class.name
    history = History.new
    isValidEvent = true;
    case event.class.name
      when "Company"
        history[:company_id] = event[:id] 
      when "Mail"
        history[:mail_id] = event[:id]
      when "Connections"
        history[:connection_id] = event[:id]
      when "Locations"
        history[:location_id] = event[:id]
      when "Price"
        history[:price_id] = event[:id]
      else 
        isValidEvent = false;
    end
    if(isValidEvent)
      history.save
    end 
  end
end
