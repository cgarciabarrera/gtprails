class CreateGpsPoints < ActiveRecord::Migration
  def change
    create_table :gps_points do |t|
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
