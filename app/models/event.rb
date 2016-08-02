# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  event_name :string
#  desription :text
#  date       :date
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#  time       :time
#  user_id    :integer
#

class Event < ActiveRecord::Base
  belongs_to :user
  
  geocoded_by:location 
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
  after_validation :lat_changed?
  private

# This is used to make sure that our address is actually parsed properly and we
# get a valuable lat/long
def lat_changed?
    if (self.location_changed?)
        if !(self.latitude_changed?)
            self.errors.add(:location, "is not valid")
            return false
        end
    end
    return true
end
 

  
    
end
