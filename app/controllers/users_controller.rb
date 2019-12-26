class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:index, :show]
  before_action :logout_recomend, only: [:new]
  before_action :ensure_correct_user, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit  
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
      log_in @user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to user_path(@user), notice: 'User was successfully destroyed.'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
