class AddImeiToDevice < ActiveRecord::Migration
  def self.up
    add_column :devices, :imei, :string
  end

  def self.down
    remove_column :devices, :imei
  end
end
