class Public::ShoesController < ApplicationController

  def new
    @shue = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
    if @shoe.save
      redirect_to shoe_path(@shoe.id)
    else
      @shoes = Shoe.all
      render :index
    end
  end

  def index
    @shoes = Shoe.all
    @shoe = Shoe.new
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def edit
    @Shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.update(shoe_params)
      redirect_to inner_path(@shoe.id)
    else
      render :edit
    end
  end

  private
  def shoe_params
    params.require(:shoe).permit(:shoeImage, :name, :size, :color)
  end

end
