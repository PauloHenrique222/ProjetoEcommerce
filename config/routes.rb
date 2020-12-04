Rails.application.routes.draw do

  root to: 'site/home#index'
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :categories
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
  end

  devise_for :admins
  devise_for :members

end
