class ExpencesController < ApplicationController
  def index
    @expences = current_user.expences
  end

  def show
    @expence = current_user.expences.find(params[:id])
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
    @expence = current_user.expences.find(params[:id])
  end

  def update
    expence = current_user.expences.find(params[:id])
    expence.update!(expence_params)
    redirect_to expences_url, notice: "支出「#{expence.name}」を更新しました。"
  end

  def destroy
    expence = current_user.expences.find(params[:id])
    expence.destroy
    redirect_to expences_url, notice: "支出「#{expence.name}」を削除しました。"
  end

  private
  
  def expence_params
    params.require(:expence).permit(:name, :amount, :description)
  end

end
