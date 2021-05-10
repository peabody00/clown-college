Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/teacherlogin' => 'sessions#teacher_new'
  post '/teacherlogin' => 'sessions#teacher_create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  root 'welcome#index'
  resources :activities
  resources :courses
  resources :schedules
  resources :students_activities
  resources :teachers do
    resources :courses
    resources :activities
  end
  resources :students do
    resources :schedules
    resources :students_activities
  end
  resources :sessions


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
