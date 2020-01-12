Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'info#top'
  get 'info/new' => 'info#new'

  devise_for :publics
  devise_for :admins
  devise_for :companies

  namespace :admins do
  	resources :publics, only: [:show, :update, :destroy]
  	resources :companies, only: [:show, :update, :destroy]
  	resources :recipes, only: [:edit, :show, :update, :destroy]
  	resources :commodities, only: [:edit, :show, :update, :destroy]
  end

  namespace :publics do
  	resources :users, only: [:show, :update, :destroy]
    get 'shop' => 'reserves#shop'
    get 'restaurant' => 'reserves#restaurant'
    get 'create' => 'reserves#create'
  	resources :recipes
  end

  namespace :companies do
  	resources :users, only: [:new, :create, :destroy, :show, :update]
  end

end
