class AddAccuracyAndProviderToGpsPoints < ActiveRecord::Migration
  def self.up
    add_column :gps_points, :accuracy, :integer
    add_column :gps_points, :provider, :string
  end

  def self.down
    remove_column :gps_points, :accuracy
    remove_column :gps_points, :provider
  end
end

