class LikesController < ApplicationController
  before_action :sweet_params

  def create
    Like.create(user_id: current_user.id, sweet_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, sweet_id: params[:id]).destroy
  end

  private

  def sweet_params
    @sweet = Sweet.find(params[:id])
  end
end
