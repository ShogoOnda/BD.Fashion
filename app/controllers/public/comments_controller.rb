class Public::CommentsController < ApplicationController

  def create
    @outer = Outer.find(params[:outer_id])
    @inner = Inner.find(params[:inner_id])
    @bottom = Bottom.find(params[:bottom_id])
    @shoe = Shoe.find(params[:shoe_id])

    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to request.referer, notice: "アウトプットを投稿しました"
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(outer_id: params[:outer_id], inner_id: params[:inner_id], bottom_id: params[:bottom_id], shoe_id: params[:shoe_id])
  end
end
