Rails.application.routes.draw do

  root 'welcome#initial'
  get 'home', to:'welcome#home'
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
  get 'delanishow', to: 'articles#delanishow'
  get 'luthershow', to: 'articles#luthershow'
  get 'stephanieshow', to: 'articles#stephanieshow'

  resources :comments
  resources :articles




  resources :articles do
    resources :replies
end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
