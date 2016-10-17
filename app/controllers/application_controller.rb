class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method def current_user
    # this caused bug in saving state in the view method of video
    # controller because executing the where resulting a new object
    # each time current_user was called. Within single controller
    # action this should return same object (arguably). I'm keeping 
    # it with the ||= assignment, but YMMV
    @current_user ||= User.where(id: session[:user_id]).first
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
