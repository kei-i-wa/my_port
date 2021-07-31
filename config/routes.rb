Rails.application.routes.draw do
  get 'departments/index'
  get 'departments/create'
  get 'departments/edit'
  get 'departments/update'
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  resources :posts
  devise_for :users
  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
