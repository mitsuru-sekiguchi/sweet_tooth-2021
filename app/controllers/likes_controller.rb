class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, sweet_id: params[:id])
    redirect_to sweets_path
  end
end
