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
    @score.destroy
    redirect_to admin_scores_path
  end
  
  private
  
  def score_params#入力されたデータが、作成データとして許可されているパラメータか確認する
    params.require(:score).permit(:file, :name, :artist, :categories)
  end
end
