class Public::OutersController < ApplicationController

  def new
    @outer = Outer.new
  end

  def index
    @outers = params[:tag_id].present? ? Tag.find(params[:tag_id]).outers : current_user.outers.all
    @user = current_user
  end

  def create
    @outer = Outer.new(outer_params)
    @outer.user_id = current_user.id

    if @outer.save!
      redirect_to outer_path(@outer.id), notice: '登録しました'
    else
      @outers = Outer.all
      @user = @outer.user
      render :index
    end
  end

  def show
    @outer = Outer.find(params[:id])
    @user = @outer.user
    @outercomment = Outercomment.new　#追加
    @outercomments = @outer.outercomments.includes(:user)
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
    params.require(:outer).permit(:outerImage, :name, :size, :color, :brand, :review, :status, tag_ids: [])
  end

end
