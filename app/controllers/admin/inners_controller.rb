class Admin::InnersController < ApplicationController
  def index
    @inner = Inner.new
    @inners = Inner.all
    @user = User.all
  end

  def show
    @inner = Inner.find(params[:id])
  end

  private

  def inner_params
    params.require(:inner).permit( :innerImage , :name, :review)
  end
end
