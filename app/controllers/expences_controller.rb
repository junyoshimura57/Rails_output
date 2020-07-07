class ExpencesController < ApplicationController
  def index
    @expences = Expence.all
  end

  def show
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
  end

  private
  
  def expence_params
    params.require(:expence).permit(:name, :amount, :description)
  end

end
