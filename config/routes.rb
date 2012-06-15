Blog::Application.routes.draw do

  resources :tags

  mount Jasminerice::Engine => '/jasmine'
  
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create', as: 'signup'


  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'login'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users

  scope 'api' do
    resources :posts
  end

  root to: 'main#index'

#  match '*path', to: 'main#index'

end
