class Public::BottomsController < ApplicationController

  def new
    @bottom = Bottom.new
  end


  def index
    @bottoms = params[:tag_id].present? ? Tag.find(params[:tag_id]).bottoms : Bottom.all
    @user = current_user
  end

  def create
    @bottom = Bottom.new(bottom_params)
    @bottom.user_id = current_user.id

    if @bottom.save!
      redirect_to bottom_path(@bottom.id), notice: 'You have created book successfully.'
    else
      @bottoms = Bottom.all
      @user = @bottom.user
      render :index
    end
  end

  def show
    @bottom = Bottom.find(params[:id])
    @user = @bottom.user
  end

  def edit
    @bottom = Bottom.find(params[:id])
    if @bottom.user == current_user
      render "edit"
    else
      redirect_to bottoms_path
    end
  end


  def update
    @bottom = Bottom.find(params[:id])
    if @bottom.update(bottom_params)
      redirect_to bottom_path(@bottom.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @bottom = Bottom.find(params[:id])
    @bottom.destroy
    redirect_to bottoms_path
  end

  private
  def bottom_params
    params.require(:bottom).permit(:bottomImage, :name, :size, :color, :brand, :review, :status, tag_ids: [])
  end

end

