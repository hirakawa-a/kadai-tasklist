class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @taskpost = current_user.taskpost.build
      @taskposts = current_user.taskpost.order('created_at DESC').page(params[:page])
    end
  end
end
