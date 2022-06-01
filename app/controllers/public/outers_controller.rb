class Public::OutersController < ApplicationController

  def new
    @outer = Outer.new
  end

  def create
    @outer = Outer.new(outer_params)
    if @outer.save
      redirect_to outer_path(@outer.id)
    else
      @outers = Outer.all
      render :index
    end
  end

  def index
    @outers = Outer.all
    @outer = Outer.new
  end

  def show
    @outer = Outer.find(params[:id])
  end

  def edit
    @outer = Outer.find(params[:id])
  end

  def update
    @outer = Outer.find(params[:id])
    if @outer.update(outer_params)
      redirect_to outer_path(@outer.id)
    else
      render :edit
    end
  end

  private
  def outer_params
    params.require(:outer).permit(:outerImage, :name, :size, :color, :shoulder, :width, :length, :sleeve, :maxtemperature, :mintemperature)
  end

end
