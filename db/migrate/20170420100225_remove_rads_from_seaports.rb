class RemoveRadsFromSeaports < ActiveRecord::Migration[5.0]
  def change
    change_table :seaports do |t|
      t.remove :latitude_rad
      t.remove :longitude_rad
    end
  end
end
