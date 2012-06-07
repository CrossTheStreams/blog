Blog::Application.routes.draw do
  
  get "admin" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "sign_up" => "users#new" 
  resources :users
  resources :sessions

  
  scope "api" do
    resources :posts
  end

  root to: "main#index"




end
