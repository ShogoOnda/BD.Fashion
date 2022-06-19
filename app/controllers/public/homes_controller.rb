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

# 以下を追加
  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def oneday_parameter
    params.require(:oneday).permit(:title, :outer_id, :inner_id, :bottom_id, :shoe_id, :start_time)
  end
end

