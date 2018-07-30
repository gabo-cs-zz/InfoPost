Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
#   get 'posts', to: 'posts#index'
#   post 'posts', to: 'posts#create'
#   get 'posts/new', to: 'posts#new'
#   get 'posts/:id', to: 'posts#show', as: :post
#   get 'posts/:id/edit', to: 'posts#edit', as: :edit_post
#   patch 'posts/:id', to: 'posts#update'
  resources :posts, :home, :user
end

