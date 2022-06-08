Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root :to =>"homes#top"
    get "/about"=>"homes#about", as: 'about'
    get "/users/my_page" => "users#show", as: "my_page"
    get "/users/unsubscribe"=>"users#unsubscribe", as: 'unsubscribe'
    resources :outers
    resources :inners
    resources :bottoms
    resources :shoes
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root :to =>"homes#top"
    get "admin/home/about"=>"admin/homes#about", as: 'about'
    resources :users, only: [:index, :show, :edit, :update]
    resources :outers, only: [:index, :show, :destroy]
    resources :inners, only: [:index, :show, :destroy]
    resources :bottoms, only: [:index, :show, :destroy]
    resources :shoes, only: [:index, :show, :destroy]
  end


end
