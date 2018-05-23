Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end

  namespace :api do
    post "login"  => "sessions#create"
    delete "logout" => "sessions#destroy"

    resources :users
  end

  get     "login"    => "sessions#new"
  post    "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"

  resources :users
end
