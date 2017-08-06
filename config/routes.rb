Rails.application.routes.draw do
  get 'sample2' => 'sample2#index'
  get 'sample1' => 'sample1#index'
  get 'home' => 'home#index'

  resources :days
  resources :fees
  resources :addresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
