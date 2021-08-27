Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  namespace :departments do
    resources :searches, only: :index
  end

  resources :departments, only: %i(index create edit update) do
  end

  namespace :posts do
    resources :searches, only: :index
  end

  resources :posts do
    # コメントは投稿に紐づくのでネストさせる
    resources :post_comments, only: %i(create destroy)
    # お気に入り
    resource :favorites, only: %i(create destroy)
    get 'favorite_order' => 'posts#favorite_order'
    get 'favorite_weekly_order' => 'posts#favorite_weekly_order'
    get 'comment_order' => 'posts#comment_order'
    get 'comment_weekly_order' => 'posts#comment_weekly_order'
    get 'impressions_order' => 'posts#impressions_order'
  end

  namespace :users do
    resources :searches, only: :index
  end

  resources :notifications, only: %i(index destroy)

  resources :users, only: %i(show index edit update) do
    member do
      get :favorites
      get :comments
      get :confirm
      get :destroy_confirm
      patch :destroy_user
    end
  end
  resources :departments, only: %i(index edit update create)

  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # タグの検索で使用する
  get 'search_tag' => 'posts#search_tag'

  namespace :groups do
    resources :searches, only: :index
  end

  resources :groups do
    get 'join' => 'groups#join'
    delete 'all_destroy' => 'groups#all_destroy'
    get 'new/mail' => 'groups#new_mail'
    get 'send/mail' => 'groups#send_mail'
  end
end
