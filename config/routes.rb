HackerNews::Application.routes.draw do
  root to: 'links#index'

  resources :links, :except => [:edit, :update]

  resources :comments, :except => [:new, :show, :destroy]

  resources :votes, :only => [:create, :destroy]

end
