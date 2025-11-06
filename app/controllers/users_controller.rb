class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/users
  def index
    users = User.all
    render json: { users: users }
  end

  # GET /api/users/:id
  def show
    render json: @user
  end

  # POST /api/users
  # Accepts flat JSON body: { name: ..., email: ..., password: ... }
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /api/users/:id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  # POST /api/login
  # Expects flat JSON: { email: '...', password: '...' }
  # Returns: { token: '<api_key>', user: { ... } }
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      # Ensure user has an API key (generate if missing)
      unless user.api_key.present?
        user.update(api_key: SecureRandom.hex(24))
      end
      render json: { token: user.api_key, user: user }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  # Accept flat or nested params. Cypress sends flat JSON in tests.
  def user_params
    if params[:user]
      params.require(:user).permit(:name, :email, :password)
    else
      params.permit(:name, :email, :password)
    end
  end
end
