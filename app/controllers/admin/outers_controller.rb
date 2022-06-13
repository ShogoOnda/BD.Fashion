class Admin::OutersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @outer = Outer.new
    @outers = Outer.all
    @user = User.all
  end

  def show
    @outer = Outer.find(params[:id])
  end

  def destroy
    # @outerreview = Outer.find(params[:id]).review
    @outer = Outer.find(params[:id])
    @outerreview= Outer.where({ review: { id: params[:id] } })
    @outerreview.destroy
    @outer.destroy
    redirect_to admin_outers_path
  end

  private

  def outer_params
    params.require(:outer).permit( :outerImage , :name, :review)
  end
end
