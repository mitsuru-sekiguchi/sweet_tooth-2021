class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @sweet = current_user.sweets
  end
end
