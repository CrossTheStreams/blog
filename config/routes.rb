Blog::Application.routes.draw do
  
  get "admin" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "sign_up" => "users#new"

  mount Jasminerice::Engine => "/jasmine"

  resources :users
  resources :sessions

  
  scope "api" do
    resources :posts
  end

  root to: "main#index"

  match '*path', to: 'main#index'

end
