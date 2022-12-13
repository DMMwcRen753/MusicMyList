class Public::ScoreListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @score_lists = current_user.score_lists.all
  end
  
  def update
    score_list = ScoreList.find(params[:id])
    score_list.update(score_list_params)
    redirect_to score_lists_path
  end
  
  def destroy
    score_list = ScoreList.find(params[:id])
    score_list.destroy
    redirect_to score_lists_path
  end

  def destroy_all
    ScoreList.destroy_all
    current_user.score_lists.destroy_all
    redirect_to score_lists_path
  end

  def create
    score = ScoreList.find_by(score_id: params[:score_list][:score_id], user_id: current_user.id)
    if score
      score.update
    else
      score_list = ScoreList.new(score_list_params)
      score_list.user_id = current_user.id
      score_list.save
    end
    redirect_to score_lists_path
  end

  private

  def score_list_params
    params.require(:score_list).permit(:score_id)
  end

end
