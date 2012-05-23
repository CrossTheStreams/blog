Blog::Application.routes.draw do
  
  get "sessions/new", :as => :admin
  get "assign-new-user" => "users#new", :as => :new_user

  match "admin" => "sessions#new"

  scope "api" do
    resources :posts
  end

  root to: "main#index"
  match '*path', to: 'main#index'

  resources :users
  resources :sessions

end
