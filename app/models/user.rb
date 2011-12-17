class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships, :class_name => "User"
  has_many :checkins

  def my_timeline
    self.checkins.order('created_at DESC').includes(:place)
  end
  
  def friend_timeline
    self.checkins.order('created_at DESC')
  end
  def friend_timeline_to_json
    result = []
    self.friend_timeline.each do |checkin|
      result << checkin.to_json
    end
    "[" + result.join(',') + "]"
  end

  def checkin(attr)
    checkin = self.checkins.build(:place_id => attr[:place_id], :message => attr[:message])
    self.checkins << checkin
  end
end
