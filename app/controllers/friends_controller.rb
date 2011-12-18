class FriendsController < ApplicationController
  def index
    @friends = @user.friends
    respond_to do |format|
      format.json { render :json => @friends, :status => :ok }
    end
  end
  def addable
    @friends = @user.addable_friends
    respond_to do |format|
      format.json { render :json => @friends, :status => :ok }
    end
  end
  def create
    @friendship = @user.friendships.build(:friend_id => params[:id])
    @friendship.save
    respond_to do |format|
      format.json { render :json => nil, :status => :ok }
    end
  end
end
