Rails.application.routes.draw do
  resources :videos
  resources :services
  root 'leads#new'
  resources :blogs
  resources :leads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
