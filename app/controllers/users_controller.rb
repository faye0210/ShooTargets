class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  def show
    from  = Time.current.at_beginning_of_day
    to    = (from + 6.day).at_end_of_day
    @targets = current_user.targets.where(deadline: from...to)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
