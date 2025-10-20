Rails.application.routes.draw do
  # Root route
  root "hello#index"
  
  # Hello controller
  get "hello", to: "hello#index"

  # Users
  resources :users, only: [:index, :show, :create] do
    collection do
      post :login
    end
  end

  # Credit Transactions
  resources :credit_transactions, only: [:index, :show, :create]

  # Scales
  resources :scales

  # Scale Versions
  resources :scale_versions

  # Surveys
  resources :surveys

  # Survey Assignments
  resources :survey_assignments, only: [:index, :show, :create]

  # Survey Analyses
  resources :survey_analyses, only: [:index, :show, :create]
end
