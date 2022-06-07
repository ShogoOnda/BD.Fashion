class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @outers = Outer.all
    @inners = Inner.all
    @bottoms = Bottom.all
    @shoes = Shoe.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
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
