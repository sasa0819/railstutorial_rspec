class MicropostsController < ApplicationController
  before_action :authenticate_user!
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

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
