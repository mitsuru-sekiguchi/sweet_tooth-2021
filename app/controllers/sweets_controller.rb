class SweetsController < ApplicationController
  def index
    @sweets = Sweet.all
  end

  def new
    @sweets = Sweet.new
  end

  def create
    @sweet = Sweet.new(sweet_params)
  end


private

  def sweet_params
    params.require(:sweet)permit(:name, :price, :shop_info, :text, :image).merge(user_id: current_user.id)
  end
end
