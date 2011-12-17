class Checkin < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  
  belongs_to :user
  belongs_to :place

  def to_json
    JSON.dump({
                :id => self.id,
                :user_name => self.user.name,
                :place_name => self.place.name,
                :checkin_time => distance_of_time_in_words_to_now(self.created_at) + " ago"
              })
  end
end
