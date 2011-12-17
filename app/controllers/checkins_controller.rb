# -*- coding: utf-8 -*-
class CheckinsController < ApplicationController
  def create
    saved_id = []
    ActiveRecord::Base.transaction do
      params[:records].each do |record|
        @checkin = @user.checkins.build(:message => record[:message], :place_id => record[:place_id])
        @checkin.save!
        saved_id << @checkin.id
      end
    end
    # NOTICE: 登録したレコードをsenchaにjsonで返す必要がある
    @saved_checkins = @user.checkins.where(:id => saved_id)
    respond_to do |format|
      format.json { render :json => @saved_checkins, :status => :ok }
    end
  end
end
