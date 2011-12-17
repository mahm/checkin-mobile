# -*- coding: utf-8 -*-
class PlacesController < ApplicationController
  def index
    @places = Place.all
    render :json => @places, :status => :ok
  end
  
  def create
    saved_id = []
    ActiveRecord::Base.transaction do
      params[:records].each do |record|
        @place = Place.new(:name => record[:name])
        @place.save!
        saved_id << @place.id
      end
    end
    # NOTICE: 登録したレコードをsenchaにjsonで返す必要がある
    @saved_places = Place.where(:id => saved_id)
    respond_to do |format|
      format.json { render :json => @saved_places, :status => :ok }
    end
  end
end
