class ApplicationController < ActionController::Base
  before_filter :authenticate_user
  def authenticate_user
    unless @user = current_user
      respond_to do |format|
        format.json { render :json => nil, :status => :unauthorized }
      end
    end
  end
  
  helper_method :current_user
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
