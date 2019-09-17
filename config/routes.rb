Rails.application.routes.draw do
  resources :shipmentimports
  resources :parcels
  resources :shipments
  devise_for :users
  resources :carriers
  root 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
