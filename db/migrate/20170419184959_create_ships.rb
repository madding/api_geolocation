class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.decimal :hold_capacity, default: 0

      t.timestamps
    end
  end
end
