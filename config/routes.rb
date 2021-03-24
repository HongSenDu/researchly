Rails.application.routes.draw do
  resources :users
  get "users/:id/view", to: "users#view", as: 'view_user'
  get '/groups/:id/join_group', to: 'groups#join_group', as: 'join_group'
  #get 'welcome/index'
  resources :groups
  resources :deliverables
  resources :projects
  devise_for :users, :path => 'u'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'


end
