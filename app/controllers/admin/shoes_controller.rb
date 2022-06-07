class Admin::ShoesController < ApplicationController
  def index
    @shoe = Shoe.new
    @shoes = Shoe.all
    @user = User.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  private

  def shoe_params
    params.require(:shoe).permit( :shoeImage , :name, :review)
  end
end
