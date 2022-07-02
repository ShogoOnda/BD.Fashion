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
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    resources :users do
      collection do
        get 'my_page'
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :outers do
      resources :outercomments, only: [:edit, :update, :create, :destroy]
    end
    resources :inners do
      resources :innercomments, only: [:edit, :update, :create, :destroy]
    end
    resources :bottoms do
      resources :bottomcomments, only: [:edit, :update, :create, :destroy]
    end
    resources :shoes do
      resources :shoecomments, only: [:edit, :update, :create, :destroy]
    end
    resources :items, only: [:index, :show]

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
