class SeaportShip < ApplicationRecord
  self.table_name = :seaports_ships

  belongs_to :seaport
  belongs_to :ship
end
