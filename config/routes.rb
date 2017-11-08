Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, :controllers => { :omniauth_callbacks => "customers/omniauth_callbacks" }

  resources :products, only: [:index]
  authenticated :customer do
    root to: 'products#index', as: :authenticated_root
  end
  root to: redirect('/customers/sign_in')

  namespace :admin do
    resources :products, only: [:index]
    root 'products#index'
  end

end
