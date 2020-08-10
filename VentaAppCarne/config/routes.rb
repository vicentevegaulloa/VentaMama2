Rails.application.routes.draw do
  devise_for :admins
  resources :sale_periods
  resources :sales do
    member do
      get :next_state
    end
  end
  resources :products
  resources :searches

  # resources :client_searches
  resources :clients do
    resources :directions
  end
  root to: 'pages#home'
  get 'pages/nueva_venta', to: 'pages#nueva_venta'
  post 'pages/nueva_venta', to: 'pages#crear_venta'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
