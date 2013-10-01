class AddIndexToDeviceIdGpsPoints < ActiveRecord::Migration
  def self.up
    add_index :gps_points, :device_id
  end

  def self.down
    remove_index :gps_points, :device_id
  end
end
