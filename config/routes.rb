Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # devise_for :users
  namespace :departments do
  resources :searches, only: :index
  end
  
  
  resources :departments,only:[:index,:create,:edit,:update] do
    get'search'
  end
  
  namespace :posts do
  resources :searches, only: :index
  end  
  
  resources :posts do
    # コメントは投稿に紐づくのでネストさせる
    resources:post_comments,only:[:create,:destroy]
    # お気に入り
    resource:favorites,only:[:create,:destroy]
  end
  
  namespace :users do
  resources :searches, only: :index
  end
  
  resources :users, only: [:show,:index,:edit,:update]
  resources :departments, only: [:index,:edit,:update,:create]

  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # タグの検索で使用する
  get "search_tag"=>"posts#search_tag"
  resources :groups do
  get "join" => "groups#join"
   delete "all_destroy" => 'groups#all_destroy'
   get "new/mail" => "groups#new_mail"
   get "send/mail" => "groups#send_mail"
  end
  
  
  
end
