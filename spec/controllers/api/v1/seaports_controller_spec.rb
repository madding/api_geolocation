require 'rails_helper'

describe Api::V1::SeaportsController do
  render_views

  describe 'GET index' do
    let!(:seaport) { create(:seaport) }
    let!(:cargo) { create(:cargo, seaport: seaport) }

    before { get :index, xhr: true }

    specify do
      expect(response).to have_http_status(:ok)
      expect(response).to match_schema
    end
  end
end
