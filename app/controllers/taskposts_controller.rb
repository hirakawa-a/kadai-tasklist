class TaskpostsController < ApplicationController
  def create
    @taskpost = current_user.taskposts.build(taskpost_params)
    if @taskposts.save
      flash[:success] = 'タスクを登録しました。'
      redirect_to root_url
    else
      @taskposts = current?user.taskposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'タスクの登録に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @taskpost.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def taskpost_params
    params.require(:taskpost).permit(:content)
  end
  
  def correct_user
    @taskpost = current_user.taskposts.find_by(id: params[:id])
    unless @taskpost
      redirect_to root_path
    end
  end
end
