class ExpencesController < ApplicationController
  before_action :set_expence, only: [:show, :edit, :update, :destroy]
  def index
    # 親アカウントの場合は、紐付く子供アカウントの支出を表示
    if parent_user
      @q= Expence.joins(:user).select("expences.*, users.name AS user_name").where(users: { parent_id: parent_user.id }).ransack(params[:q])
      @self_children = parent_user.children
      @expences = @q.result(distinct: true).recent.page(params[:page])
    else
      @expences = child_user.expences.page(params[:page])
    end
  end

  def show
  end

  def new
    @expence = Expence.new
  end

  def create
    @expence = current_user.expences.new(expence_params)

    if @expence.save
      redirect_to expences_url, notice: "支出「#{@expence.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @expence.update!(expence_params)
    redirect_to expences_url, notice: "支出「#{@expence.name}」を更新しました。"
  end

  def destroy
    @expence.destroy
    redirect_to expences_url, notice: "支出「#{@expence.name}」を削除しました。"
  end

  private
  def expence_params
    params.require(:expence).permit(:name, :category, :amount, :description)
  end

  def set_expence
    @expence = current_user.expences.find(params[:id])
  end
end