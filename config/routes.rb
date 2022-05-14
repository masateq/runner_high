Rails.application.routes.draw do
  root "top_pages#top"
  resources :users, only: %i[new create edit update]
  resources :running_records, only: %i[new create edit index update destroy]
  resources :training_suggestions, only: %i[new create show]

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
