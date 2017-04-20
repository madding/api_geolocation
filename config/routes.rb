Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :ships, only: [:index] do
        get :near_cargo, on: :member
      end
      resources :cargos, only: [:index] do
        get :near_ship, on: :member
      end
      resources :seaports, only: [:index]
    end
  end
end
