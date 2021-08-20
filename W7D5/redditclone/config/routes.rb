Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :sub
  resources :post, except: [:index]
  # Come back for sub, comment, upvote
end
