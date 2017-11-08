Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, :controllers => { :omniauth_callbacks => "customers/omniauth_callbacks" }

  root 'products#index'

  resources :products, only: [:index]

  namespace :admin do
    resources :products, only: [:index]
    root 'products#index'
  end

end
