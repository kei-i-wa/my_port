Rails.application.routes.draw do
  devise_for :users
  get 'departments/index'
  get 'departments/create'
  get 'departments/edit'
  get 'departments/update'
  resources :posts
  resources :users, only: [:show,:index,:edit,:update]
  
  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
