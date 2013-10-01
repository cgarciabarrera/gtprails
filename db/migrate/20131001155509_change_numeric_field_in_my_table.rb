class ChangeNumericFieldInMyTable < ActiveRecord::Migration
  def self.up

    change_column :gps_points, :latitude, :float, {:length => 15, :decimals => 12}
    change_column :gps_points, :longitude, :float, {:length => 15, :decimals => 1}

  end

  def self.down

    change_column :gps_points, :latitude, :float, {:length => 0, :decimals => 0}
    change_column :gps_points, :longitude, :float, {:length => 0, :decimals => 0}

  end
end
