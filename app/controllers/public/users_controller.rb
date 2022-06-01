class Public::UsersController < ApplicationController
  def show
    @customer = current_user
  end

  def edit
    @customer = current_user
  end

  def update
    @customer = current_user
    if @customer.update(user_params)
      redirect_to users_path
    end
  end

  def withdraw
    @customer = current_customer
    if @customer.update(is_deleted: true)
      # 退会ステータスをデフォルトのfalse(有効)から、true(退会)に更新させる
      sign_out current_customer
    end
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:user).permit(:name, :email)
  end
end
