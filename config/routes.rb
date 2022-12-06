Rails.application.routes.draw do

  namespace :admin do
    get 'scores/index'
    get 'scores/show'
    get 'cotegories/index'
    get 'cotegories/show'
    get 'cotegories/edit'
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'mylists/show'
    get 'mylists/edit'
    get 'mylists/new'
    get 'users/show'
    get 'users/edit'
    get 'homes/top'
    get 'homes/about'
    get 'scores/index'
    get 'scores/show'
    get 'scores/edit'
    get 'scores/new'
  end
  devise_for :users, skip: [:password], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :password], controllers:{
    sessions: 'admin/sessions'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
