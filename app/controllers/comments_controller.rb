class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, user: @comment.user.nickname
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, sweet_id: params[:sweet_id])
  end
end
