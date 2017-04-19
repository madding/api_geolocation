class AddRadsToSeaports < ActiveRecord::Migration[5.0]
  def change
    change_table :seaports do |t|
      t.column :latitude_rad, :float
      t.column :longitude_rad, :float
    end
  end
end
