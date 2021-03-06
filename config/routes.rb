Rails.application.routes.draw do
  get 'requests/index'
  get 'requests/new'
  get 'requests/edit'
  get 'requests/create'
  get 'requests/update'
  get 'requests/destroy'
  mount Ckeditor::Engine => '/ckeditor'
  root :to => "leads#new"
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "users/registrations"}
  resources :leads, only: [:index, :new, :create, :show]
  # resources :videos, only: [:index, :new, :create, :destroy]
  resources :blogs
  resources :services
  resources :about, only: :index
  resources :espanol, only: :index
  resources :terms_of_use, only: :index  
  resources :requests, except: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
