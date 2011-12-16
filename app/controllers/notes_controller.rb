# -*- coding: utf-8 -*-
class NotesController < ApplicationController
  def index
    @notes = Note.all
    respond_to do |format|
      format.html
      format.json { render :json => @notes }
    end
  end

  def create
    saved_id = []
    ActiveRecord::Base.transaction do
      params[:records].each do |record|
        @note = Note.new(:title => record[:title], :narrative => record[:narrative])
        @note.save!
        saved_id << @note.id
      end  
    end
    # senchaに登録したレコードをJSONで返す必要がある
    @saved_notes = Note.where(:id => saved_id)
    respond_to do |format|
      format.json { render :json => @saved_notes, :status => :ok }
    end
  end

end
