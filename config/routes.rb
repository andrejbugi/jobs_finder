Rails.application.routes.draw do
  # not using nested routes for simpler url
  resources :jobs
  resources :job_applications

  root to: 'jobs#index'
end
