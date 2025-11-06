Rails.application.routes.draw do
  # Root route
  root "hello#index"

  # Postman API endpoints
  get 'postman/collections', to: 'postman#collections'
  get 'postman/environments', to: 'postman#environments'
  
  # Hello controller
  get "hello", to: "hello#index"

  # API namespace: all endpoints expected by Cypress live under /api
  scope '/api' do
  # Authentication
  # Accept GET as well as POST for /api/login (tests or browser may call GET)
  match 'login', to: 'users#login', via: [:get, :post]

    # Users (CRUD for tests)
    resources :users, only: [:index, :show, :create, :update, :destroy]

    # Credit Transactions
    resources :credit_transactions, only: [:index, :show, :create]

    # Scales
    resources :scales

    # Scale Versions
    resources :scale_versions
# routes.rb
get '*path', to: 'frontend#index', constraints: ->(req) { !req.xhr? && req.format.html? }

# app/controllers/frontend_controller.rb
class FrontendController < ApplicationController
  def index
    render file: Rails.root.join('client', 'build', 'index.html')
  end
end
resources :users, only: [:index, :show, :create, :update, :destroy]

    # Surveys
    resources :surveys

    # Survey Assignments
    resources :survey_assignments, only: [:index, :show, :create]

    # Survey Analyses
    resources :survey_analyses, only: [:index, :show, :create]

    # Participants
    resources :participants
  end
end
