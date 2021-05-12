class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_gon_user
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end


  protected

  def set_gon_user
    gon.current_user = current_user if logged_in?
  end

  def authenticate_user!
    redirect_to root_path, alert: "You can't access this page unless being logged in." unless logged_in?
  end
end
