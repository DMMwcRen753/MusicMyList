class Public::FavoritesController < ApplicationController
  def create
    score = Score.find(params[:score_id])
    @favorite = current_user.favorites.new(score_id: score.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    score = Score.find(params[:score_id])
    @favorite = current_user.favorites.find_by(score_id: score.id)
    @favorite.destroy
    render 'replace_btn'
  end
end
