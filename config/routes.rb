Mydog::Application.routes.draw do

  root :to => 'Lists#index'
  get "/lists" => 'Lists#index', :as => :lists

  post "/reddits/:id" => 'Reddits#postcomment', :as => :comment
  get "/fbooks/seed" => 'Fbooks#seed', :as => :fbooks_seed
  get "/imgurls/seed" => 'Imgurls#seed', :as => :imgurls_seed

  resources :imgurls, :only => [:index, :create, :destroy]
  resources :fbooks, :only => [:index, :new, :create, :destroy]
  resources :reddits, :only => [:index, :new, :create]

end
