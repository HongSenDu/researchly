Rails.application.routes.draw do
  resources :profiles
  #get 'welcome/index'
  resources :groups
  resources :deliverables
  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
