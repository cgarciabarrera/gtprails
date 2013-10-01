class GpsPoint < ActiveRecord::Base

  belongs_to :device
  validates :latitude, :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90 }, :presence => true
  validates :longitude, :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180 }, :presence => true
  validates :device_id, :presence => true
end
