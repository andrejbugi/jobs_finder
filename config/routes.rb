Rails.application.routes.draw do
  resources :jobs
  resources :job_applications

  root to: 'jobs#index'
end
