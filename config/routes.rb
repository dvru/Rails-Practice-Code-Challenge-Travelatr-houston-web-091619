Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, :destinations, :posts
  post 'post/:id/like', to: 'posts#like'
end
