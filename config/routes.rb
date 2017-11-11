Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, :controllers => { :omniauth_callbacks => "customers/omniauth_callbacks" }

  root 'products#index'

  resources :products, only: [:index, :show]

  namespace :admin do
    root 'products#index'
    resources :products do
      delete 'image/:image_id', to: 'products#destroy_image', on: :member, as: :image
      put 'image/:image_id', to: 'products#swap_image_position', on: :member, as: :swap_image_position
    end
    resources :brands, except: [:show]
    resources :categories, except: [:show]
  end

end
