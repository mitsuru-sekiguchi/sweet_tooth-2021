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

  def show
    @sweet = Sweet.find(params[:id])
  end

  def edit
    @sweet = Sweet.find(params[:id])
  end

  def update
    sweet = Sweet.find(params[:id])
    sweet.update(sweet_params)
  end


private

  def sweet_params
    params.require(:sweet).permit(:name, :price, :shop_info, :text, :image).merge(user_id: current_user.id)
  end
end
