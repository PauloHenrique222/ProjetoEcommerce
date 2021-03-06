Rails.application.routes.draw do

  root to: 'site/home#index'
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: [:show]
    resources :admins, except: [:show]
    get 'dashboard', to: 'dashboard#index'
    get 'admins', to: 'admins#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'
    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads
      resources :my_data, only: [:edit, :update]
    end
    resources :ad_datail, only: [:show]
    resources :categories, only: [:show]
    resources :comments, only: [:create]
  end

  devise_for :admins, skip: [:registrations]
  devise_for :members, controllers: {
      sessions: 'members/sessions',
      registrations: 'members/registrations'
  }

end
