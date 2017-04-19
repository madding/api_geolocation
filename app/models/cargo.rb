class Cargo < ApplicationRecord
  belongs_to :seaport

  #scope :near_for_ship
end
