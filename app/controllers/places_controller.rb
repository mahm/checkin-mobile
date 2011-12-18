# -*- coding: utf-8 -*-
class PlacesController < ApplicationController
  def index
    @places = Place.all
    render :json => @places, :status => :ok
  end
  
  def create
    @place = Place.new(:name => params[:name])
    @place.save
    respond_to do |format|
      format.json { render :json => nil, :status => :ok }
    end
  end
end
