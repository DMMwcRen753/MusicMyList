class Admin::HomesController < ApplicationController
  before_action :authenticate_admin! #ログインせずに入れないように
  def top
  end
end
