class Admin::BottomsController < ApplicationController
  def index
    @bottom = Bottom.new
    @bottoms = Bottom.all
    @user = User.all
  end

  def show
    @bottom = Bottom.find(params[:id])
  end

  private

  def bottom_params
    params.require(:bottom).permit( :bottomImage , :name, :review)
  end
end
