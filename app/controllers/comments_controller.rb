class CommentsController < ApplicationController
before_action :authenticate_user!

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントに成功しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントの投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.find_by(id: params[:id])
    unless @comment.nil?
      @comment.destroy
      flash[:success] = "削除に成功しました"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "削除に失敗しました"
      redirect_to root_url
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
