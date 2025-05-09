Rails.application.routes.draw do
  resources :students
  resources :mentors
  resources :enrollments
  resources :mentor_enrollment_assignments
  resources :lessons
  resources :courses
  resources :coding_classes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Trimester routes
  get "/trimesters", to: "trimesters#index"
  get "/trimesters/:id", to: "trimesters#show"

  # Mentor Routes 
  get "/mentors", to: "mentors#index"
  get "/mentors/:id", to: "mentors#show"

  # Defines the root path route ("/")
  root "home#index"
  
  # Admin Dashboard Routes
  get '/dashboard', to: 'admin_dashboard#index'

  # Course Route (resourceful route)
  get '/courses/:id', to: 'courses#show'
end
