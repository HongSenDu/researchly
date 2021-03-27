Rails.application.routes.draw do
  resources :profiles
  get "profiles/:id/view", to: "profiles#view", as: 'view_profile'
  get '/groups/:id/join_group', to: 'groups#join_group', as: 'join_group'
  get 'groups/search' => 'groups#search', :as => 'search_group'
  get 'groups/:id/leave_group', to: 'groups#leave_group', as: 'leave_group'
  #get 'welcome/index'
  resources :groups do
    member do
      get 'join_group'
      get 'leave_group'
    end
  end
  resources :deliverables
  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'


end
