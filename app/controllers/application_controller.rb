class ApplicationController < ActionController::Base
  helper_method :logged_in?

  before_action :authenticate!

  def logged_in?
    !session[:user].blank?
  end

  def authenticate!
    unless logged_in? || self.class == SessionController
      redirect_to login_path, notice: 'Please login'
    end
  end
end
