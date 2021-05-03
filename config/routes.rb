Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/teacherlogin' => 'sessions#teacher_new'
  post '/teacherlogin' => 'sessions#teacher_create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  root 'welcome#index'
  resources :activities
  resources :schedules
  resources :courses
  resources :teachers
  resources :students
  resources :sessions


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
