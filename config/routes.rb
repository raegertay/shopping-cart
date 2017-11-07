Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, :controllers => { :omniauth_callbacks => "customers/omniauth_callbacks" }
end
