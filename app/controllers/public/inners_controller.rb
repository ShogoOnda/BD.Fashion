class Public::InnersController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @inner = Inner.new
  end

  def index
    @inners = params[:tag_id].present? ? current_user.inners.joins(:tags).where({ tags: { id: params[:tag_id] } }) : current_user.inners.all
    @user = current_user
  end

  def create
    @inner = Inner.new(inner_params)
    @inner.user_id = current_user.id

    if @inner.save
      redirect_to inner_path(@inner.id), notice: '新規投稿を行いました。'
    else
      @inners = Inner.all
      @user = @inner.user
      render :new
    end
  end

  def show
    @inner = Inner.find(params[:id])
    @user = @inner.user
    @innercomment = Innercomment.new
    @innercomments = @inner.innercomments.includes(:user)
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

  def set_post
    @inner = Inner.find(params[:id])
  end

  def inner_params
    params.require(:inner).permit(:innerImage, :name, :size, :color, :brand, :review, :status, tag_ids: [])
  end

end

