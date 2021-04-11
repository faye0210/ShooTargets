class TargetsController < ApplicationController
  before_action :set_target, only: %i[ show edit update destroy achieve]
  before_action :authenticate_user!

  def index
    @label_list = Label.all
    if @q_label
      @targets = @q_label.joins(:targets).eager_load(:targets).where(user_id: current_user.id)
    else
      @q = Target.ransack(params[:q])
      @targets = @q.result(distinct: true).where(user_id: current_user.id)
    end
  end

  def show
    @target = Target.find(params[:id])
    @target_labels = @target.labels
  end

  def new
    @target = current_user.targets.build
  end

  def create
    @target = current_user.targets.build(target_params)
    label_list = params[:target][:name].split(nil)
    if params[:back]
      render :new
    else
      if @target.save
        @target.save_label(label_list)
        redirect_to targets_path, notice: "ターゲットを作成しました！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    label_list = params[:target][:name].split(nil)
    if @target.update(target_params)
      @target.save_label(label_list)
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
    params.require(:target).permit(:title, :detail, :deadline, label_ids: [])
  end

  def set_q_for_target
    @q_label = Target.ransack(params[:q])
  end
end
