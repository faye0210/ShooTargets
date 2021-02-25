class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  def show
    from  = Time.current.at_beginning_of_day
    to    = (from + 6.day).at_end_of_day
    @targets = current_user.targets.where(deadline: from...to)
  end

  def edit;  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "My Pageを更新しました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
