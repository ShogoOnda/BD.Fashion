class Public::OutersController < ApplicationController

  def index
    @outer = Outer.new
    @outers = Outer.all
    @user = current_user
  end

  def create
    @outer = Outer.new(outer_params)
    @outer.user_id = current_user.id
    if @outer.save
      redirect_to outer_path(@outer.id), notice: 'You have created book successfully.'
    else
      @outers = Outer.all
      @user = @outer.user
      render :index
    end
  end

  def show
    @outer = Outer.find(params[:id])
    @user = @outer.user
  end

  def edit
    @outer = Outer.find(params[:id])
    if @outer.user == current_user
      render "edit"
    else
      redirect_to outers_path
    end
  end


  def update
    @outer = Outer.find(params[:id])
    if @outer.update(outer_params)
      redirect_to outer_path(@outer.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @outer = Outer.find(params[:id])
    @outer.destroy
    redirect_to outers_path
  end

  private
  def outer_params
    params.permit(:outerImage, :name, :size, :color, :brand, :review, :status, tag_ids: [])
  end

end