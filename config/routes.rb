HackerNews::Application.routes.draw do
  root to: 'links#index'

  resources :links, :except => [:edit, :update]

end
