Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :ships, only: [:index]
      resources :seaports, only: [:index]
      resources :cargos, only: [:index]
    end
  end
end
