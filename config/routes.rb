Rails.application.routes.draw do
  get 'activities/index'

  get "users/:id/view", to: "users#view", as: 'view_user'
  get "deliverables/:id/remove", to: "deliverables#remove", as: 'remove_user'
  get '/groups/:id/join_group', to: 'groups#join_group', as: 'join_group'
  get 'groups/search' => 'groups#search', :as => 'search_group'
  get 'groups/:id/leave_group', to: 'groups#leave_group', as: 'leave_group'
  get '/groups/:id/make_leader', to: 'groups#make_leader', as: 'make_leader'

  #get 'welcome/index'
  resources :users 
  resources :activities
  resources :groups
  resources :deliverables
  resources :projects
  devise_for :users, :path => 'u'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'


end
