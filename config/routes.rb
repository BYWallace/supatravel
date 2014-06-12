Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :photos, only: [:index, :new, :create, :show, :destroy]
    resources :posts
  end

  root 'welcome#index'
  # get '/signup' => 'users#new'
  # get '/signin' => 'sessions#new'
  # delete 'signout' => 'sessions#destroy'

end
