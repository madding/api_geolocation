class Ship < ApplicationRecord
  include CapacityWithInaccuracy
  include OrderByDistances
  has_many :seaports_ships, class_name: 'SeaportShip'
  has_many :seaports, through: :seaports_ships

  scope :near_for_cargo, ->(cargo) {
    date = cargo.date

    seaport = cargo.seaport
    if seaport
      where(seaports_ships: { date: date }).
        where(ships: { hold_capacity: cargo.hold_capacity_with_inaccuracy }).
        joins(seaports_ships: :seaport).
        order_by_distances(seaport).first
    end
  }

  def current_port(date = Date.today)
    seaports_ships.where(date: date).first.try(:seaport)
  end
end
