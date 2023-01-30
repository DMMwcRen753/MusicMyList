class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(current_user.id)
    @mylists = current_user.mylists.all
    favorites= Favorite.where(user_id: @user.id).pluck(:score_id)
    @favorite_scores = Score.find(favorites)
    @score = Score.find_by(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
   @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render "edit"
    end
  end

  def unsubscribe

  end

  def withdraw
    @user = User.find(current_user.id)
    # statusカラムをtrueに変更することにより削除フラグを立てる
    @user.update(status: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :name)
  end
  
  def ensure_guest_user
    @user = User.find(current_user.id)
    if @user.name == "ゲ ス ト"
      redirect_to mypage_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
