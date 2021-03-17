class SweetsController < ApplicationController
  def index
    @sweet = Sweet.all
  end

  def new
    @sweet = Sweet.new
  end

  def create
    @sweet = Sweet.new(sweet_params)
    if @sweet.save
      redirect_to root_path
    else
      render :new
    end
  end


private

  def sweet_params
    params.require(:sweet).permit(:name, :price, :shop_info, :text, :image).merge(user_id: current_user.id)
  end
end
