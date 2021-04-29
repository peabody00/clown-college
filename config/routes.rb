Rails.application.routes.draw do
  root 'welcome#index'
  resources :activities
  resources :schedules
  resources :courses
  resources :teachers
  resources :students
  resources :sessions

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
