class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @outers = params[:tag_id].present? ? current_user.outers.joins(:tags).where({ tags: { id: params[:tag_id] } }).page(params[:page]) : current_user.outers.page(params[:page])
    @inners = params[:tag_id].present? ? current_user.inners.joins(:tags).where({ tags: { id: params[:tag_id] } }).page(params[:page]) : current_user.inners.page(params[:page])
    @bottoms = params[:tag_id].present? ? current_user.bottoms.joins(:tags).where({ tags: { id: params[:tag_id] } }).page(params[:page]) : current_user.bottoms.page(params[:page])
    @shoes = params[:tag_id].present? ? current_user.shoes.joins(:tags).where({ tags: { id: params[:tag_id] } }).page(params[:page]) : current_user.shoes.page(params[:page])

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path
    end
  end

  def withdraw
    @user = current_user
    if @user.update(is_deleted: true)
      # 退会ステータスをデフォルトのfalse(有効)から、true(退会)に更新させる
      sign_out current_user
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
