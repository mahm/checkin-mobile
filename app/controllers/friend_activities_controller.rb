class FriendActivitiesController < ApplicationController
  def index
    @friend_activities = @user.friend_timeline_to_json
    respond_to do |format|
      format.json { render :json => @friend_activities, :status => :ok }
    end
  end

  def show
  end
end
