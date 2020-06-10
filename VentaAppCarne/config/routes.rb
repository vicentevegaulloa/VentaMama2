Rails.application.routes.draw do
  resources :sale_periods
  resources :sales
  resources :products
  resources :clients do
    resources :directions
  end
  root to: 'pages#home'
  get 'pages/nueva_venta', to: 'pages#nueva_venta'
  post 'pages/nueva_venta', to: 'pages#crear_venta'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
