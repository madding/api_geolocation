class CreatePortShips < ActiveRecord::Migration[5.0]
  def change
    create_table :seaports_ships do |t|
      t.date :date
      t.references :seaport
      t.references :ship

      t.timestamps
    end
  end
end
