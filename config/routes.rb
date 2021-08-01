Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # devise_for :users
  get 'departments/index'
  get 'departments/create'
  get 'departments/edit'
  get 'departments/update'
  resources :posts
  resources :users, only: [:show,:index,:edit,:update]
  resources :departments, only: [:index,:edit,:update,:create]

  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
