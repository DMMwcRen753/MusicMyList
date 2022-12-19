class Public::MylistScoresController < ApplicationController
  before_action :authenticate_user!
  
  def update
    @mylist_score = MylistScore.find(params[:id])
    @mylist = @mylist_score.mylist
    @mylist_scores = @mylist.mylist_scores.all
    @mylist.update
  end

end
