class Cargo < ApplicationRecord
  include CapacityWithInaccuracy
  include OrderByDistances
  belongs_to :seaport

  scope :near_for_ship, ->(ship) {
    date = Date.today
    seaport = ship.current_port(date)
    if seaport
      where(date: date).
        where(hold_capacity: ship.hold_capacity_with_inaccuracy).
        joins(:seaport).
        order_by_distances(seaport).first
    end
  }
end
