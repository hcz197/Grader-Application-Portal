Rails.application.routes.draw do
  
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  post 'gradings/:id' => 'gradings#toggle_approval'

  get 'pages/welcome'

  get 'pages/verify'

  get 'gradings/recommendation' => 'gradings#recommendation'

  root 'pages#welcome'
  resources :gradings
  resources :users
  resources :courses
  get '/courses', to:'courses#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
