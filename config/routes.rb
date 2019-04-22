Rails.application.routes.draw do
  devise_for :users
  root 'leads#new'
  resources :leads, only: [:index, :new, :create, :show]
  resources :videos, only: [:index, :new, :create, :destroy]
  resources :blogs
  resources :services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
