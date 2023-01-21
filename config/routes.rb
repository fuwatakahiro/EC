Rails.application.routes.draw do
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin,  skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
  root "homes#top"
  get "about" => 'homes#about'
  resources :items, only: [:index, :show]
end
namespace :admin do
  resources :genres, only: [:index,:create, :edit, :update]
  resources :items, except: :destroy
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
