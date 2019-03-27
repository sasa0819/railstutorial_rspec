class FavoritesController < ApplicationController

  def create
    @user_id = current_user.id
    @micropost_id = Micropost.find(params[:id]).id
    @favorite = Favorite.new(micropost_id: @micropost_id, user_id: @user_id)

    if @favorite.save
      redirect_to root_path
    end
  end

  def destroy
    @micropost_id = Micropost.find(params[:id]).id
    @favorite = Favorite.find_by(micropost_id: @micropost_id)
    if @favorite.destroy
      redirect_to root_path
    end
  end
end
