Rails.application.routes.draw do

  root 'welcome#initial'
  get 'home', to:'welcome#home'
  resources :articles

  get 'signup', to:'users#new'
  #resources :users, except: [:new]
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete'logout', to: 'sessions#destroy'

  get 'stephanie', to: 'welcome#stephanie'
  get 'luther', to: 'welcome#luther'
  get 'delani', to: 'welcome#delani'
  get 'cole', to: 'welcome#cole'


  resources :comments




  resources :articles do
    resources :replies
end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
