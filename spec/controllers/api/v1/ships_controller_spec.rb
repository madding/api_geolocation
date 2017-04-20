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

  describe 'GET near_cargo' do
    let(:date) { Date.today }
    let!(:ship) { create(:ship, hold_capacity: 10) }
    let!(:seaport) { create(:seaport, latitude: 1, longitude: 1) }
    let!(:seaport_ship) { create(:seaport_ship, date: date, ship: ship, seaport: seaport) }

    context 'when cargo in current seaport' do
      let!(:cargo1) { create(:cargo, date: date, seaport: seaport, hold_capacity: 9) }
      let!(:cargo2) do
        create(:cargo, date: date, seaport: create(:seaport), hold_capacity: 10)
      end

      before { get :near_cargo, params: { id: ship.id }, xhr: true }

      specify do
        expect(response).to have_http_status(:ok)
        expect(response).to match_schema
        expect(assigns[:cargo]).to eql(cargo1)
      end
    end

    context 'when cargo not in current seaport' do
      let!(:cargo1) do
        create(:cargo, date: date, seaport: create(:seaport, latitude: 2, longitude: 4), hold_capacity: 9)
      end
      let!(:cargo2) do
        create(:cargo, date: date, seaport: create(:seaport, latitude: 10, longitude: 11), hold_capacity: 10)
      end
      let!(:cargo3) do
        create(:cargo, date: date, seaport: seaport, hold_capacity: 5) # wrong capacity
      end

      before { get :near_cargo, params: { id: ship.id }, xhr: true }

      specify do
        expect(response).to have_http_status(:ok)
        expect(response).to match_schema
        expect(assigns[:cargo]).to eql(cargo1)
      end
    end
  end
end
