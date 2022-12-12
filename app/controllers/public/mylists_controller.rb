class Public::MylistsController < ApplicationController
  before_action :authenticate_user!
  def show
    @mylist =Mylist.find(params[:id])
    @mylist_scores = MylistScores.where(mylist_id: @mylist.id)
  end

  def edit
    @mylist = Mylist.find(params[:id])
  end

  def new
    @score_lists = current_user.score_lists ##ログインカスタマーのscore_list内scoreを指定
    if @score_lists == nil ##score_list内アイテムの有無を確認
      render mypage_path(current_user.id) ##mypageに戻る
    else
    @mylist = Mylist.new
    end
  end
  
  def update
    @mylist = Mylist.find(params[:id])
    @mylist.update
    redirect_to mylist_path(@mylist.id)
  end

  def destroy
    @mylist = Mylist.find(params[:id])
    @mylist.destroy
    redirect_to mypage_path(current_user.id)
  end

  def create
    @mylist = Mylist.new(mylist_params)
    @mylist.user_id = current_user.id
    if @mylist.save
      @score_lists.each do |score_list| ## score_list内アイテムを1つずつ取り出す---------------
        mylist_score = MylistScore.new ##新規作成                                            |
        mylist_score.mylist_id = @mylist.id ##mylist_idにidを反映させる                      |
        mylist_score.score_id = score_list.score_id ##商品を反映させる                       |
        mylist_score.save ##保存                                                         \|/ 繰り返し
      end
      
      @score_lists.destroy_all ##カート内アイテムはもういらないから消す（まだdestroy_all使用不可）
      redirect_to mypage_path(current_user.id)
    else
      render :new
    end
  end

  private

  def mylist_params
    params.require(:mylist).permit(:name)
  end

end
