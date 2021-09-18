Rails.application.routes.draw do
  resources :jobs do
    resources :job_applications
  end

  root to: 'jobs#index'
end
