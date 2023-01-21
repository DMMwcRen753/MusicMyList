# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to scores_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  protected

  def after_sign_in_path_for(resource)#ログイン成功時の環移先指定
    scores_path
  end

  def after_sign_out_path_for(resource) #ログアウト成功時の環移先指定
    root_path
  end
  

  def user_state # 退会しているかを判断するメソッド
    ## 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 取得したアカウントのパスワードと入力されたパスワードが一致してるか、退会しているかを判別
    if @user.valid_password?(params[:user][:password]) && (@user.status == true)
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_customer_registration_path
    else
      flash[:notice] = "入力に間違いがあります"
    end
  end
end
