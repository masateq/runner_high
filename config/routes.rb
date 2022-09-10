Rails.application.routes.draw do
  root "top_pages#top"
  resources :users, only: %i[new create edit update]
  resources :running_records, only: %i[new create edit index update destroy]
  resource :training_suggestions, only: %i[new create show edit update]
  
  get "start" => "top_pages#start"
  get "tutorial" => "top_pages#tutorial"
  
  get "terms" => "static_pages#terms"
  get "privacy" => "static_pages#privacy"

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
