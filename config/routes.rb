Rails.application.routes.draw do
  root to: 'welcome#index'
  namespace :admin do
    resources :categories, only: [:new]
    resources :images, only: [:new]
  end

  resources :categories do
    resources :ideas 
  end

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/admin', to: 'sessions#new'
end
