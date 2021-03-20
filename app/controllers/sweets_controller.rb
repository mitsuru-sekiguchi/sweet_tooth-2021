class SweetsController < ApplicationController
  before_action :set_sweet, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show]

  def index
    @sweet = Sweet.includes(:user).order("created_at DESC")
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
    @comment = Comment.new
    @comments = @sweet.comments.includes(:user)
  end

  def edit
  end

  def update
    sweet = Sweet.find(params[:id])
    if sweet.update(sweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    sweet = Sweet.find(params[:id])
    redirect_to root_path if sweet.destroy
  end

  private

  def sweet_params
    params.require(:sweet).permit(:name, :price, :shop_info, :text, :image).merge(user_id: current_user.id)
  end

  def set_sweet
    @sweet = Sweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
