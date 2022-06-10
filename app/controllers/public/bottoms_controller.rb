class Public::BottomsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @bottom = Bottom.new
  end


  def index
    @user = current_user
    @bottoms = params[:tag_id].present? ? Tag.find(params[:tag_id]).bottoms : current_user.bottoms.all
  end

  def create
    @bottom = Bottom.new(bottom_params)
    @bottom.user_id = current_user.id
    if @bottom.save!
      redirect_to bottom_path(@bottom.id),　notice: '新規投稿を行いました。'
    else
      render :new
    end
  end

  def show

    if @bottom.status_private? && @bottom.user != current_user
      redirect_to bottoms_path, notice: 'このページにはアクセスできません'
    end

    @bottom = Bottom.find(params[:id])
    @user = @bottom.user
    @comment = Comment.new
    @comments = @bottom.comments.includes(:user)
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

  def set_post
    @bottom = Bottom.find(params[:id])
  end

  def bottom_params
    params.require(:bottom).permit(:bottomImage, :name, :size, :color, :brand, :review, :status, tag_ids: [])
  end

end

