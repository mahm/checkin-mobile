# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships, :class_name => "User"
  has_many :checkins

  def my_timeline
    self.checkins.order('created_at DESC').includes(:place)
  end
  
  def friend_timeline
    Checkin.where(:user_id => self.friends).order('created_at DESC').includes(:user, :place)
  end
  def friend_timeline_to_json
    result = []
    if self.checkins.empty?
      "[" + Checkin.dummy_json + "]"
    else
      # friendのタイムラインの一番上には、自身の直前のチェックインが表示される
      result << self.checkins.last.to_json
      self.friend_timeline.each do |checkin|
        result << checkin.to_json
      end
      "[" + result.join(',') + "]"
    end
  end
  def addable_friends
    User.where("id NOT IN (?)", [self.friends, self].flatten)
  end

  serialize :auth
  def self.create_with_omniauth(auth)
    new_user = User.new(name: auth[:info][:name], provider: auth[:provider], uid: auth[:uid], auth: auth)
    new_user.save!
    new_user
  end
  def token
    self.auth["credentials"]["token"]
  end
end
