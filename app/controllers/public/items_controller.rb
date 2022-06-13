class Public::ItemsController < ApplicationController

  before_action :set_post, only: [:show]

  def index
    @outers = params[:tag_id].present? ? Tag.find(params[:tag_id]).outers.where(status: 1) : Outer.where(status: 1)
    @inners = params[:tag_id].present? ? Tag.find(params[:tag_id]).inners.where(status: 1) : Inner.where(status: 1)
    @bottoms = params[:tag_id].present? ? Tag.find(params[:tag_id]).bottoms.where(status: 1) : Bottom.where(status: 1)
    @shoes = params[:tag_id].present? ? Tag.find(params[:tag_id]).shoes.where(status: 1) : Shoe.where(status: 1)
  end

  def show

    if @outer.status_private? && @outer.user != current_user
      redirect_to items_path, notice: 'このページにはアクセスできません'
    end
    @outer = Outer.find(params[:id])

    if @inner.status_private? && @inner.user != current_user
      redirect_to items_path, notice: 'このページにはアクセスできません'
    end
    @inner = Inner.find(params[:id])

    if @bottom.status_private? && @bottom.user != current_user
      redirect_to items_path, notice: 'このページにはアクセスできません'
    end
    @bottom = Bottom.find(params[:id])

    if @shoe.status_private? && @shoe.user != current_user
      redirect_to items_path, notice: 'このページにはアクセスできません'
    end
    @shoe = Shoe.find(params[:id])
  end


end
