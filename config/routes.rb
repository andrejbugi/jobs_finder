Rails.application.routes.draw do
  devise_for :users
  resources :jobs do
    resources :job_applications
  end

  root to: 'jobs#index'
end
