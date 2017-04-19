require 'rails_helper'

describe Api::V1::ShipsController do
  render_views

  describe 'GET index' do
    let!(:ship) { create(:ship) }
    let!(:seaport) { create(:seaport) }
    let!(:seaport_ship) { create(:seaport_ship, ship: ship, seaport: seaport) }

    before { get :index, xhr: true }

    specify do
      expect(response).to have_http_status(:ok)
      expect(response).to match_schema
    end
  end
end
