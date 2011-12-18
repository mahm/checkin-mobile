# -*- coding: utf-8 -*-
class CheckinsController < ApplicationController
  def create
    @checkin = @user.checkins.build(:message => params[:message], :place_id => params[:place_id])
    @checkin.save
    respond_to do |format|
      format.json { render :json => nil, :status => :ok }
    end
  end
end
