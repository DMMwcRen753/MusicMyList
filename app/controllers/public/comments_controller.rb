class Public::CommentsController < ApplicationController
  def create
    score = Score.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    @comment.score_id = score.id
    @comment.save
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], score_id: params[:score_id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
