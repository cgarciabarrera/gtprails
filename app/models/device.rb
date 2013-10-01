class Device < ActiveRecord::Base
  has_many :gps_points
  validates :name, :presence => true
end
