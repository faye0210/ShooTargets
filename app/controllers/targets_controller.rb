class TargetsController < ApplicationController
  before_action :set_target, only: %i[ show edit update destroy]
  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: %i[edit update destroy]

  def index
    @targets = Target.all
  end

  def show; end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if params[:back]
      render :new
    else
      if @target.save
        redirect_to targets_path, notice: ""
      else
        render :new
      end
    end
  end

  def edit; end

  def update
    if @blog.update(target_params)
      redirect_to targets_path, notice: ""
    else
      render :edit
    end
  end

  def destroy
    @target.destroy
    redirect_to targets_path, notice: ""
  end

  private
  def set_target
    @target = Target.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:title, :detail, :deadline)
  end

  # def ensure_correct_user
  #
  # end
end
