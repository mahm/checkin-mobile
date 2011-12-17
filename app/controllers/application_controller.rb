class ApplicationController < ActionController::Base
  before_filter :load_adhoc_user
  def load_adhoc_user
    @user = User.first
  end
end
