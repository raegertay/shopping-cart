Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, :controllers => { :omniauth_callbacks => "customers/omniauth_callbacks" }

  root 'products#index'

  resources :products, only: [:index]

  namespace :admin do
    root 'products#index'
    resources :products
    resources :brands, except: [:show]
  end

end
