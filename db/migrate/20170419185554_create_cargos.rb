class CreateCargos < ActiveRecord::Migration[5.0]
  def change
    create_table :cargos do |t|
      t.string :name
      t.date :date
      t.references :seaport
      t.decimal :hold_capacity

      t.timestamps
    end
  end
end
