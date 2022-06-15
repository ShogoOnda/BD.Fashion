class Public::OutersController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @outer = Outer.new
  end

  def index
    @outers = params[:tag_id].present? ? current_user.outers.joins(:tags).where({ tags: { id: params[:tag_id] } }) : current_user.outers.all
    @user = current_user
  end

  def create
    @outer = Outer.new(outer_params)
    @outer.user_id = current_user.id
    if @outer.save
      redirect_to outer_path(@outer.id), notice: '新規登録を行いました'
    else
      # @outer = Outer.new
      @outers = Outer.all
      @user = @outer.user
      render :new
    end
  end

  def show

    if @outer.status_private? && @outer.user != current_user
      redirect_to my_page_path, notice: 'このページにはアクセスできません'
    end

    @outer = Outer.find(params[:id])
    @user = @outer.user
    @outercomment = Outercomment.new
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
      redirect_to outer_path(@outer.id), notice: '情報を更新しました'
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

  def set_post
    @outer = Outer.find(params[:id])
  end

  def outer_params
    params.require(:outer).permit(:outerImage, :name, :size, :color, :brand, :review, :status, tag_ids: [])
  end

end
