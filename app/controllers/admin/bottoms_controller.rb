class Admin::BottomsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @bottom = Bottom.new
    @bottoms = Bottom.all
    @user = User.all
  end

  def show
    @bottom = Bottom.find(params[:id])
  end

  def destroy
    # @bottom = Bottom.find(params[:id])
    @bottom.review.destroy
    @bottom.destroy
    redirect_to admin_bottoms_path
  end

  private

  def bottom_params
    params.require(:bottom).permit( :bottomImage , :name, :review)
  end
end
