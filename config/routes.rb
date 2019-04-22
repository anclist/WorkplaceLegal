Rails.application.routes.draw do
  root :to => "leads#new"
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :leads, only: [:index, :new, :create, :show]
  resources :videos, only: [:index, :new, :create, :destroy]
  resources :blogs
  resources :services
  resources :about, only: :index
  resources :espanol, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
