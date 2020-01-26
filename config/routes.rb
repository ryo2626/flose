Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'info#top'

  devise_for :publics, :controllers => {
    :passwords => 'publics/passwords',
    :sessions => 'publics/sessions'
  }
  devise_for :companies, :controllers => {
    :passwords => 'companies/passwords',
    :sessions => 'companies/sessions'
  }

  devise_for :admins


  resources :info, only: [:new, :create]

  namespace :admins do
  	resources :publics, only: [:index, :edit, :update, :destroy]
  	resources :companies, only: [:index, :edit, :update, :destroy]
  	resources :recipes, only: [:index, :edit, :update, :destroy]
  	resources :commodities, only: [:index, :edit, :update, :destroy]
    resources :info, only: [:index, :edit, :update, :destroy]
  end

  namespace :publics do
  	resources :users, only: [:show, :update, :destroy]
    get 'shop' => 'reserves#shop'
    get 'restaurant' => 'reserves#restaurant'
    resources :reserves, only: [:create]
  	resources :recipes
  end

  namespace :companies do
    resources :commodities, only: [:new, :create, :show]
  	resources :users, only: [:show, :update, :destroy]
  end

end
