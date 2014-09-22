class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize
    if current_user.nil?
      flash[:alert] = "Not authorized"
      respond_to do |format|
        format.js { render :js => "window.location = '/sessions/new'" }
        format.html { redirect_to new_session_path }
      end
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
