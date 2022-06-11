class Public::InnercommentsController < ApplicationController
  def create
    @inner = Inner.find(params[:inner_id])
    @innercomment = current_user.innercomments.build(comment_params)
    if @innercomment.save
      redirect_to request.referer, notice: "アウトプットを投稿しました"
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:innercomment).permit(:body).merge(inner_id: params[:inner_id])
  end
end
