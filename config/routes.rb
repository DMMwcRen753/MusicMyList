Rails.application.routes.draw do
  
  devise_for :users, skip: [:password], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admins, skip: [:registrations, :password], controllers:{
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top' #管理者側のルートをtop画面にする
    resources :scores, only: [:index, :show, :destroy]
    resources :cotegories, except: [:new]
    resources :users, only: [:index, :edit, :show, :update]
  end
  namespace :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :scores do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :mylists
    
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/info/edit' => 'users#edit', as: 'info_edit'
    patch 'users/info' => 'users#update', as: 'info'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
