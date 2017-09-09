Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :admin do
    resources :categories
  end

  namespace :admin do
    resources :images
  end

  resources :users do
    resources :ideas do
      resources :idea_images
    end
  end

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/admin', to: 'sessions#new'
end
