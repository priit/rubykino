Rubykino::Application.routes.draw do
  root :to => 'root#index'

  resources :users
  resources :votes

  resources :videos do
    resources :votes
  end
end
