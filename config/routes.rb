Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # devise_for :users
  get 'departments/index'
  get 'departments/create'
  get 'departments/edit'
  get 'departments/update'
  resources :posts do
    # コメントは投稿に紐づくのでネストさせる
    resources:post_comments,only:[:create,:destroy]
    # お気に入り
    resource:favorites,only:[:create,:destroy]
  end
  
  resources :users, only: [:show,:index,:edit,:update]
  resources :departments, only: [:index,:edit,:update,:create]

  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # タグの検索で使用する
  get "search_tag"=>"posts#search_tag"
  resources :groups
end
