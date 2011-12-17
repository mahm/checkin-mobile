class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  def to_json
    JSON.dump({
                :user_name => self.user.name,
                :place_name => self.place.name,
                :checkin_time => self.checkin_time
              })
  end

  def checkin_time
    t = Time.now
    minutes = (t - self.created_at) / 60
    return minutes.truncate.to_s + " minutes ago" if minutes < 60
    return (minutes / 24).ceil.to_s + " hours ago" if minutes >= 60 && minutes < 3600
    return (minutes / 24 / 24).ceil.to_s + " days ago" if minutes >= 3600
  end
end
