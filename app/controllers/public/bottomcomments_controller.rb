class Public::BottomcommentsController < ApplicationController
  def create
    @bottom = Bottom.find(params[:bottom_id])
    @bottomcomment = current_user.bottomcomments.build(comment_params)
    if @bottomcomment.save
      redirect_to request.referer, notice: "アウトプットを投稿しました"
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:bottomcomment).permit(:body).merge(bottom_id: params[:bottom_id])
  end
end
