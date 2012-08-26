Blog::Application.routes.draw do

  get 'admin' => 'admin#index'

  mount Jasminerice::Engine => '/jasmine'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  scope 'api' do
    resources :posts 
    resources :keywords
    get '/posts/search/:query' => 'posts#search'
  end

  get 'page/:id' => 'main#index'
  get 'search/:query' => 'main#search'

  root to: 'main#index'

  match '*path' => redirect('/') 

end
