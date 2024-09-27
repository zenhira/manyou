class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :admin_user
  
    def index
      @users = User.all
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_user_path(@user), notice: '作成成功'
      else
        render :new, notice: '作成できませんでした'
      end
    end
  
    def update
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: '更新できました'
      else
        render :edit, notice: '編集できませんでした'
      end
    end
  
    def destroy
      if @user.destroy
        redirect_to admin_users_path, notice: '削除できました'
      else
        redirect_to admin_users_path, notice: '削除できませんでした'
      end
    end
  
    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end
  end
  