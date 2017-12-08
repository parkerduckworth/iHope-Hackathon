Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :creators
  devise_for :users
  resources :creators do
    resources :posts
  end
  resources :users
  root 'static_pages#home'
  resources :charges
end
