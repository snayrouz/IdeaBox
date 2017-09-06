Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
