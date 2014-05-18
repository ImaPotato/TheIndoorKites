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
end
