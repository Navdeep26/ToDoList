Rails.application.routes.draw do
  devise_for :users
  resources :products do 
  	resources :comments
  end
  root  "products#index"

  get '/admin' => "admins#index"
  resources :admins
end
