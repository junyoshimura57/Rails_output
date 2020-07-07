class ExpencesController < ApplicationController
  def index
    @expences = Expence.all
  end

  def show
    @expence = Expence.find(params[:id])
  end

  def new
    @expence = Expence.new
  end

  def create
    expence = Expence.new(expence_params)
    expence.save!
    redirect_to expences_url, notice: "支出「#{expence.name}」を登録しました。"
  end

  def edit
    @expence = Expence.find(params[:id])
  end

  def update
    expence = Expence.find(params[:id])
    expence.update!(expence_params)
    redirect_to expences_url, notice: "支出「#{expence.name}」を更新しました。"
  end

  def destroy
    expence = Expence.find(params[:id])
    expence.destroy
    redirect_to expences_url, notice: "支出「#{expence.name}」を削除しました。"
  end

  private
  
  def expence_params
    params.require(:expence).permit(:name, :amount, :description)
  end

end
