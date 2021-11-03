Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
    as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"
    get "confirmation" => "devise/confirmations#new"
    get "password reset" => "devise/passwords#new"
    put "password edit" => "devise/passwords#edit"
    #post "confirmation.user" => "devise/confirmation#create"
  end
  resources :bubbles
  get 'static/pages'
  get 'static/home'
  get 'static/help'
  root "static_pages#home"
  resources :password_resets, only:[:new, :create, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
