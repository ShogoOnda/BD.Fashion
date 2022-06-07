class Public::InnersController < ApplicationController

  def index
    @inner = Inner.new
    @inners = Inner.all
    @user = current_user
  end

  def create
    @inner = Inner.new(inner_params)
    @inner.user_id = current_user.id
    if @inner.save
      redirect_to inner_path(@inner.id), notice: 'You have created book successfully.'
    else
      @inners = Inner.all
      @user = @inner.user
      render :index
    end
  end

  def show
    @inner = Inner.find(params[:id])
    @user = @inner.user
  end

  def edit
    @inner = Inner.find(params[:id])
    if @inner.user == current_user
      render "edit"
    else
      redirect_to inners_path
    end
  end


  def update
    @inner = Inner.find(params[:id])
    if @inner.update(inner_params)
      redirect_to inner_path(@inner.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @inner= Inner.find(params[:id])
    @inner.destroy
    redirect_to inners_path
  end

  private
  def inner_params
    params.permit(:innerImage, :name, :size, :color, :brand, :review, :status, tag_ids: [])
  end

end

