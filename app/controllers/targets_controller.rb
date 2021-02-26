class TargetsController < ApplicationController
  before_action :set_target, only: %i[ show edit update destroy achieve]
  before_action :authenticate_user!

  def index
    @q = Target.ransack(params[:q])
    @targets = @q.result(distinct: true)
    @targets = @targets.where(user_id: current_user.id)
  end

  def show; end

  def new
    @target = current_user.targets.build
  end

  def create
    @target = current_user.targets.build(target_params)
    if params[:back]
      render :new
    else
      if @target.save
        redirect_to targets_path, notice: "ターゲットを作成しました！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @target.update(target_params)
      redirect_to targets_path, notice: "ターゲットを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @target.destroy
    redirect_to targets_path, notice: "ターゲットを削除しました！"
  end

  def achieve
    @target.update status: true
    redirect_to targets_path, notice: "#{@target.title}を達成しました！おめでとう！！"
  end

  private
  def set_target
    @target = Target.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:title, :detail, :deadline)
  end
end
