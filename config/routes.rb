Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :admin do
    resources :categories
    resources :images
  end

  resources :users, except: [:new] do
    resources :ideas do
      resources :idea_images
    end
  end

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/admin', to: 'sessions#new'
end
