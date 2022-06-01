class Public::BottomsController < ApplicationController

  def new
    @bottom = Bottom.new
  end

  def create
    @bottom = Bottom.new(bottom_params)
    if @bottom.save
      redirect_to bottom_path(@bottom.id)
    else
      @bottoms = Bottom.all
      render :index
    end
  end

  def index
    @bottoms = Bottom.all
    @bottom = Bottom.new
  end

  def show
    @bottom = Bottom.find(params[:id])
  end

  def edit
    @bottom = Bottom.find(params[:id])
  end

  def update
    @bottom = Bottom.find(params[:id])
    if @bottom.update(bottom_params)
      redirect_to bottom_path(@bottom.id)
    else
      render :edit
    end
  end

  private
  def bottom_params
    params.require(:bottom).permit(:bottomImage, :name, :size, :color, :waist, :hip, :inseam, :maxtemperature, :mintemperature)
  end

end

