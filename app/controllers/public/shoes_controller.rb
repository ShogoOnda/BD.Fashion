class Public::ShoesController < ApplicationController

  def new
    @shoe = Shoe.new
  end

  def index
    @shoe = Shoe.new
    @shoes = Shoe.all
    @user = current_user
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.user_id = current_user.id
    if @shoe.save
      redirect_to shoe_path(@shoe.id), notice: 'You have created book successfully.'
    else
      @shoes = Shoe.all
      @user = @shoe.user
      render :index
    end
  end

  def show
    @shoe = Shoe.find(params[:id])
    @user = @shoe.user
  end

  def edit
    @shoe = Shoe.find(params[:id])
    if @shoe.user == current_user
      render "edit"
    else
      redirect_to shoes_path
    end
  end


  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.update(shoe_params)
      redirect_to shoe_path(@shoe.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
    redirect_to shoes_path
  end

  private
  def shoe_params
    params.require(:shoe).permit(:shoeImage, :name, :size, :color, :brand, :review, :status, tag_ids: [])
  end

end
