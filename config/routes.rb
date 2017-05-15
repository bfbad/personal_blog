Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/contact'

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
end
