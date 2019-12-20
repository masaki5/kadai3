Rails.application.routes.draw do
  devise_for :users
  resources :homes
  root "homes#top"

  resources :books, only: [:new, :create, :top, :index, :show, :destroy, :update, :edit]
  post 'books' => 'books#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resourcesメゾットはルーティングを一括して自動生成してくれます。一方、onlyは、生成するルーティングを限定するオプション
  resources :users, only: [:show, :edit, :update, :index, :top, :new, :destroy]

  #resources :homes, only: [:top, :about]
  get    '/home/about',      to: 'homes#about'
  get    '/user/user.id',   to: 'users#user.id'
end