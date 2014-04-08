HackerNews::Application.routes.draw do
  root to: 'links#index'

  resources :links, :except => [:edit, :update]

  resources :comments, :except => [:show, :destroy, :edit, :update]

  resources :votes, :only => [:create, :destroy]

end
