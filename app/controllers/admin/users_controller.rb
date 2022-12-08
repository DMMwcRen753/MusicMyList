class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.permit(:name, :email, :status)
    #名前・メアド・会員ステータス
    #上記以外の物が入らないように設定
  end
end
