Rails.application.routes.draw do
  
  get '/topics/tree', to: 'topics#tree', as: 'tree'
  # resources :article_keywords
  resources :dislikes, only: [:index, :create, :destroy] 
  resources :likes, only: [:index, :create, :destroy]
  resources :users, only: [:index, :show, :create, :destroy]
  resources :articles, only: [:index, :show]
  resources :topics, only: [:index, :show]

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
