class AddDeviceIdToGpsPoint < ActiveRecord::Migration
  def self.up
    add_column :gps_points, :device_id, :integer
  end

  def self.down
    remove_column :gps_points, :devide_id
  end
end
