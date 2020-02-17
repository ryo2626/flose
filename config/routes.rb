Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'info#top'

  devise_for :publics, :controllers => {
    :sessions => 'publics/sessions',
    :registrations => 'publics/registrations'
  }
  devise_for :companies, :controllers => {
    :sessions => 'companies/sessions',
    :registrations => 'companies/registrations'
  }
  devise_for :admins

  get 'about' => 'info#about'
  resources :info, only: [:new, :create]

  namespace :admins do
  	resources :publics, only: [:index, :edit, :update, :destroy]
  	resources :companies, only: [:index, :edit, :update, :destroy]
  	resources :recipes, only: [:index, :edit, :update, :destroy]
  	resources :commodities, only: [:index, :edit, :update, :destroy]
    resources :info, only: [:index, :edit, :update]
  end

  namespace :publics do
  	resources :users, only: [:show, :update, :destroy]
    get 'shop' => 'reserves#shop'
    get 'restaurant' => 'reserves#restaurant'
    resources :reserves, only: [:create]
  	resources :recipes
    post   '/like/:recipe_id' => 'likes#like',   as: 'like'
    delete '/like/:recipe_id' => 'likes#unlike', as: 'unlike'
  end

  namespace :companies do
    resources :commodities, only: [:new, :create, :show]
  	resources :users, only: [:show, :update, :destroy]
  end

end
