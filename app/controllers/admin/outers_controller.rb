class Admin::OutersController < ApplicationController

  def index
    @outer = Outer.new
    @outers = Outer.all
    @user = User.all
  end

  def show
    @outer = Outer.find(params[:id])
  end

  private

  def outer_params
    params.require(:outer).permit( :outerImage , :name, :review)
  end
end
