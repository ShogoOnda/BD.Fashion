class Public::InnersController < ApplicationController

  def new
    @inner = Inner.new
  end

  def create
    @inner = Inner.new(inner_params)
    if @inner.save
      redirect_to inner_path(@inner.id)
    else
      @inners = Inner.all
      render :index
    end
  end

  def index
    @inners = Inner.all
    @inner = Inner.new
  end

  def show
    @inner = Inner.find(params[:id])
  end

  def edit
    @inner = Inner.find(params[:id])
  end

  def update
    @inner = Inner.find(params[:id])
    if @inner.update(inner_params)
      redirect_to inner_path(@inner.id)
    else
      render :edit
    end
  end

  private
  def inner_params
    params.require(:inner).permit(:innerImage, :name, :size, :color, :shoulder, :width, :length, :sleeve, :maxtemperature, :mintemperature)
  end

end

