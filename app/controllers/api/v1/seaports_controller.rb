module Api
  module V1
    class SeaportsController < Api::V1::BaseController
      def index
        @seaports = Seaport.all
      end
    end
  end
end
