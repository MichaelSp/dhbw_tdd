Rails.application.routes.draw do
  post :login, to: 'session#create'
  delete :login, to: 'session#destroy'
  get :login, to: 'session#new'
  resources :users
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
