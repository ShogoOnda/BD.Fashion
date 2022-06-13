class Admin::InnersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @inner = Inner.new
    @inners = Inner.all
    @user = User.all
  end

  def show
    @inner = Inner.find(params[:id])
  end

  def destroy
    @inner = Inner.find(params[:id])
    @inner.review.destroy
    @inner.destroy
    redirect_to admin_inners_path
  end

  private

  def inner_params
    params.require(:inner).permit( :innerImage , :name, :review)
  end
end
