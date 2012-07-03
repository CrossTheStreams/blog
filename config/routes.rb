Blog::Application.routes.draw do

  get "posts/new"
  get "posts/edit"

  get "admin" => "admin#index"

  resources :tags

  mount Jasminerice::Engine => '/jasmine'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'login'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users

  scope 'api' do
    resources :posts
  end

  get "page/:id" => 'main#index'

  root to: 'main#index'

  match '*path' => 'main#index' 

end
