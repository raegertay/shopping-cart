Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers, :controllers => { :omniauth_callbacks => "customers/omniauth_callbacks" }

  root 'products#index'

  resources :products, only: [:index, :show]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'minus/:product_id', to: 'carts#minus', as: :minus_from
  end

  namespace :admin do
    root 'products#index'
    resources :products do
      member do
        delete 'image/:image_id', to: 'products#destroy_image', as: :image
        put 'image/:image_id/swap', to: 'products#swap_image_position', as: :swap_image_position
        put 'image/:image_id', to: 'products#change_image', as: :change_image
      end
    end
    resources :brands, except: [:show]
    resources :categories, except: [:show]
  end

  resources :transactions, only: [:new, :create]
  get 'redirect_to_cart', to: 'transactions#redirect_to_cart'

  resources :orders, only: [:index, :show]

end
