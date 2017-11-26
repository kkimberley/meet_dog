Rails.application.routes.draw do
  namespace :admin do
    get 'dogs/index'
  end

  namespace :admin do
    get 'dogs/new'
  end

  namespace :admin do
    get 'dogs/create'
  end

  namespace :admin do
    get 'dogs/show'
  end

  namespace :admin do
    get 'dogs/edit'
  end

  namespace :admin do
    get 'dogs/update'
  end

  namespace :admin do
    get 'dogs/destroy'
  end

  resources :posts
  resources :dashboards
  root 'dashboards#index'  

  resources :posts do
    resources :comments
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Mount API
  mount BuilderApi => '/api'
end
