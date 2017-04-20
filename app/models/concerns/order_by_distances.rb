module OrderByDistances
  extend ActiveSupport::Concern

  included do
    # only order, join needed in models
    scope :order_by_distances, ->(seaport) {
      order("
        (acos(sin( radians(#{seaport.latitude}) ) * sin( radians(seaports.latitude) ) + cos( radians(#{seaport.latitude}) ) *
              cos( radians(seaports.latitude) ) * cos( radians(#{seaport.longitude}) - radians(seaports.longitude) )) *
        #{Math::RADIUS_EARTH})")
    }
  end
end
