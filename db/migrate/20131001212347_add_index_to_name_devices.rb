class AddIndexToNameDevices < ActiveRecord::Migration
  def self.up
    add_index :devices, :name
  end

  def self.down
    remove_index :prices, :name
  end
end
