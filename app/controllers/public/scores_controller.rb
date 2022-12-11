class Public::ScoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @scores = Score.all #全ての投稿を読み込ませる
  end

  def show
    @score = Score.find(params[:id]) #idを参照して一つの投稿を表示する
    @categories = Category.all #viewの表示フォームへ今あるカテゴリを全て渡す
    @comment = Comment.new
  end

  def edit
    @score = Score.find(params[:id]) #idを参照して一つの投稿を表示する
    @categories = Category.all #viewの表示フォームへ今あるカテゴリを全て渡す
  end

  def new
    @score = Score.new #viewへ渡すインスタンス変数に空のmodelオブジェクトを渡す
    @categories = Category.all #viewの入力フォームへ今あるカテゴリを全て渡す
  end

  def create
    #idを付与して投稿を作成する
    @score = Score.new(score_params)
    @score.user_id = current_user.id

    if @score.save#作成が成功した場合
      redirect_to score_path(@score.id)#作成した投稿の詳細ページへ行く
    else#作成ができなかった場合
      render :new#作成画面へ戻る
    end
  end

  def update
    #idを参照して更新する投稿を探す
    @score = Score.find(params[:id])
    if @score.update(score_params)#更新が成功した場合
      redirect_to score_path(@score.id)#更新した投稿の詳細ページへ行く
    else#更新ができなかった場合
      render 'edit'#編集画面へ戻る
    end
  end

  private

  def score_params#入力されたデータが、作成データとして許可されているパラメータか確認する
    params.require(:score).permit(:name, :artist, :category_id, images: [])
  end

end
