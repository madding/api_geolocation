module Api
  module V1
    class ShipsController < Api::V1::BaseController
      def index
        @ships = Ship.all
      end

      def near_cargo
        @ship = Ship.find(params[:id])
        @cargo = Cargo.near_for_ship(@ship)
      end
    end
  end
end
