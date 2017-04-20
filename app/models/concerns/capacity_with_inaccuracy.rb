module CapacityWithInaccuracy
  extend ActiveSupport::Concern

  def hold_capacity_with_inaccuracy
    inaccuracy = hold_capacity * 0.1 # 10%
    (hold_capacity - inaccuracy)..(hold_capacity + inaccuracy)
  end
end
