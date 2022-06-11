class Public::ShoecommentsController < ApplicationController
  def create
    @shoe = Shoe.find(params[:shoe_id])
    @shoecomment = current_user.shoecomments.build(comment_params)
    if @shoecomment.save
      redirect_to request.referer, notice: "アウトプットを投稿しました"
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:shoecomment).permit(:body).merge(shoe_id: params[:shoe_id])
  end
end
