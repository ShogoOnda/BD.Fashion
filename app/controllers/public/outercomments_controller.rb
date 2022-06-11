class Public::OutercommentsController < ApplicationController
  def create
    @outer = Outer.find(params[:outer_id])
    @outercomment = current_user.outercomments.build(comment_params)
    if @outercomment.save
      redirect_to request.referer, notice: "アウトプットを投稿しました"
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:outercomment).permit(:body).merge(outer_id: params[:outer_id])
  end
end
