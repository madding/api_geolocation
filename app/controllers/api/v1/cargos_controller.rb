module Api
  module V1
    class CargosController < Api::V1::BaseController
      def index
        @cargos = Cargo.all
      end

      def near_ship
        @cargo = Cargo.find(params[:id])
        @ship = Ship.near_for_cargo(@cargo)
        @seaport = Seaport.seaport_for_ship_on_date(@ship, @cargo.date)
      end
    end
  end
end
