Rails.application.routes.draw do

  devise_for :users

  resources :blogs do
    resources :posts
  end

  root 'welcome#index'
  # get '/signup' => 'users#new'
  # get '/signin' => 'sessions#new'
  # delete 'signout' => 'sessions#destroy'

end
