Rails.application.routes.draw do
  resources :activities
  resources :schedules
  resources :courses
  resources :teachers
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
