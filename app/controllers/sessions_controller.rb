class SessionsController < ApplicationController
  skip_before_filter :authenticate_user
  
  def create
    logger.info "facebook callback me!"
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    user.auth = auth
    user.save!
    session[:user_id] = user.id
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def error
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def auth; request.env["omniauth.auth"] end
end
