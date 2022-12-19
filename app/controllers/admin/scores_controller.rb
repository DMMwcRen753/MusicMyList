class Admin::ScoresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @scores = Score.all #全ての投稿を読み込ませる
  end

  def show
    @score = Score.find(params[:id]) #idを参照して一つの投稿を表示する
    @categories = Category.all #viewの表示フォームへ今あるカテゴリを全て渡す
  end
  
  def destroy
    @score = Score.find(params[:id])
    @score.destroy
    redirect_to admin_scores_path
  end
  
end
