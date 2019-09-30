Rails.application.routes.draw do
  resources :article_keywords
  resources :dislikes
  resources :likes
  resources :users
  resources :articles
  resources :topics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
