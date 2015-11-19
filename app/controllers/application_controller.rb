class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method def current_user
    User.where(id: session[:user_id]).first
  end

  def log_in
    session[:user_id] = params[:id]
    redirect_to :back
  end

  def log_out
    session.delete :user_id
    redirect_to :back
  end
end
