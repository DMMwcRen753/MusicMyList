class Public::MylistsController < ApplicationController
  before_action :authenticate_customer!
  def show
  end

  def edit
  end

  def new
  end
  
  def update
    mylist = Mylist.find(params[:id])
    mylist.update(mylist_params)
    redirect_to mylists_path
  end

  def destroy
    mylist = Mylist.find(params[:id])
    mylist.destroy
    redirect_to mylists_path
  end

  def destroy_all
    Mylist.destroy_all
    current_user.mylists.destroy_all
    redirect_to mylists_path
  end

  def create
    score = Mylist.find_by(score_id: params[:mylist][:score_id], user_id: current_user.id)
    mylist = Mylist.new(mylist_params)
    mylist.user_id = current_user.id
    mylist.save
    redirect_to mylists_path
  end

  private

  def mylist_params
    params.require(:mylist).permit(:user_id)
  end

end
