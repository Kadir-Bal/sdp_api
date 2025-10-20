class UsersController < ApplicationController
  # Kullanıcıları listeleme (opsiyonel)
  def index
    @users = User.all
    render json: @users
  end

  # Kullanıcı kaydı
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: "success", user: @user }, status: :created
    else
      render json: { status: "error", errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Kullanıcı girişi
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      render json: { status: "success", user: @user }
    else
      render json: { status: "error", message: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
