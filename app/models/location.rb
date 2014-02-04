# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  city       :text
#  state      :text
#  zip        :integer
#  created_at :datetime
#  updated_at :datetime
#  latitude   :float
#  longitude  :float
#

class Location < ActiveRecord::Base
  has_many :projects

  def self.box_coordinates(latitude, longitude, distance=0.3)
    # Return hash of coordinates
    # Outside can be accessed by loc = Location(10, 10)
    #                            loc[:max_y]
    {
      max_x: latitude + distance,
      max_y: longitude + distance,
      min_x: latitude - distance,
      min_y: longitude - distance
    }
  end
end
