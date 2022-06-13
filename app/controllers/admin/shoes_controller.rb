class Admin::ShoesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @shoe = Shoe.new
    @shoes = Shoe.all
    @user = User.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def destroy
    # @shoereview = Shoe.find(params[:id]).review
    @shoe = Shoe.find(params[:id])
    @shoe.review.destroy
    @shoe.destroy
    redirect_to admin_shoes_path
  end

  private

  def shoe_params
    params.require(:shoe).permit( :shoeImage , :name, :review)
  end
end
