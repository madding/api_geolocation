require 'rails_helper'

describe Api::V1::CargosController do
  render_views

  describe 'GET index' do
    let(:seaport) { create(:seaport) }
    let!(:cargo) { create(:cargo, seaport: seaport) }

    before { get :index, xhr: true }

    specify do
      expect(response).to have_http_status(:ok)
      expect(response).to match_schema
    end
  end

  describe 'GET near_ship' do
    let(:date) { Date.today }

    let(:seaport) { create(:seaport, latitude: 1.0, longitude: 1.0) }
    let!(:cargo) { create(:cargo, date: date, hold_capacity: 10) }

    context 'when ship in seaport with cargo' do
      let(:ship) { create(:ship, hold_capacity: 11) }
      let!(:seaport_ship1) { create(:seaport_ship, date: date, ship: ship, seaport: seaport) }
      let!(:seaport_ship2) do
        create(:seaport_ship, date: date, seaport: create(:seaport, latitude: 3.0, longitude: 1.5))
      end

      before { get :near_ship, params: { id: cargo.id }, xhr: true }

      specify do
        expect(response).to have_http_status(:ok)
        expect(response).to match_schema
        expect(assigns[:ship]).to eql(ship)
      end
    end

    context 'when ship not in current seaport' do
      let(:ship) { create(:ship, hold_capacity: 11) }
      let!(:seaport_ship1) do
        create(:seaport_ship, date: date, ship: ship, seaport: create(:seaport, latitude: 3.0, longitude: 1.5))
      end
      let!(:seaport_ship2) do
        # not near
        create(:seaport_ship, date: date, seaport: create(:seaport, latitude: 4.0, longitude: 1.5))
      end
      let!(:seaport_ship3) do
        # wrong date
        create(:seaport_ship, date: date - 1.days, seaport: create(:seaport, latitude: 3.0, longitude: 1.5))
      end
      let!(:seaport_ship4) do
        # wrong capacity
        create(:seaport_ship, date: date, ship: create(:ship, hold_capacity: 2), seaport: seaport)
      end

      before { get :near_ship, params: { id: cargo.id }, xhr: true }

      specify do
        expect(response).to have_http_status(:ok)
        expect(response).to match_schema
        expect(assigns[:ship]).to eql(ship)
      end
    end
  end
end
