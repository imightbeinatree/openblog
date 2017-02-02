Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :posts, except: [:destroy] do
    collection do
      get 'my'
    end
  end
  devise_for :users
  root 'posts#index'
end
