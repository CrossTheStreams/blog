Blog::Application.routes.draw do
 
  match "login" => "sessions#new"

  mount Jasminerice::Engine => "/jasmine"

  resources :users

  scope(:path_names => {:new => "login", :destroy => "logout"}) do
    resources :sessions, :only => [:new, :destroy]
  end

  
  scope "api" do
    resources :posts
  end

  root to: "main#index"

  match '*path', to: 'main#index'

end
