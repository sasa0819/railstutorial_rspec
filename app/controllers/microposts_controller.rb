class MicropostsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost.nil?
      @micropost.destroy
      flash[:success] = "削除に成功しました"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "削除に失敗しました"
      redirect_to root_url
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end
end
