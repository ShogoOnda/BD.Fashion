class Public::HomesController < ApplicationController

  def index
    @onedays = Oneday.all
    @oneday = Oneday.new
  end

  def new
    @oneday = Oneday.new
  end

  def show
    @oneday= Oneday.find(params[:id])
  end

  def create
    Oneday.create(oneday_parameter)
    redirect_to onedays_path
  end

  def destroy
    @oneday = Oneday.find(params[:id])
    @oneday.destroy
    redirect_to onedays_path, notice:"削除しました"
  end

  def edit
    @oneday = Oneday.find(params[:id])
  end

  def update
    @oneday = Oneday.find(params[:id])
    if @oneday.update(oneday_parameter)
      redirect_to onedays_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def oneday_parameter
    params.require(:oneday).permit(:title, :outer_id, :inner_id, :bottom_id, :shoe_id, :start_time)
  end
end

