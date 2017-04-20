class Seaport < ApplicationRecord
  has_many :cargos
  has_many :seaports_ships, class_name: 'SeaportShip'

  scope :seaport_for_ship_on_date, ->(ship, date) {
    joins(seaports_ships: :ship).
      find_by(ships: { id: ship.id }, seaports_ships: { date: date })
  }
end
