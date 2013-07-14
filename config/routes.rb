Blog::Application.routes.draw do

  get 'admin' => 'admin#index'

  match '/admin/keyword' => 'admin#keyword', :as => 'admin_keyword'

  
  get '/about' => 'static#about'
  get '/music' => 'static#music'
  get '/projects' => 'static#projects'

  if Rails.env == "test"
    mount Jasminerice::Engine => '/jasmine'
  end

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  scope 'api' do
    resources :posts
    post '/posts/:id/update' => 'posts#update'
    get '/posts/search/:query(/:page)' => 'posts#search'
    get '/posts/tag/:keyword' => 'posts#tag'
    delete 'posts/:id' => 'posts#destroy'
    get '/tags/' => 'tags#index'
    get '/tags/keyword/:name(/:page)' => 'tags#keyword'
    get '/tags/post/:id' => 'tags#post'
    get '/tags/page/:page' => 'tags#page'
    get '/tags/search/:query' => 'tags#search'
  end

  get 'page/:id' => 'main#index'
  get 'search/:query' => 'main#search'

  root to: 'main#index'

  match '*path' => 'main#index' 

end
