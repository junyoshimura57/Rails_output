class Admin::ChildrenController < Admin::BaseController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    # 紐付く子供アカウントを取得
    @children = parent_user.children
  end

  def show
  end

  def new
    @child = User.new
  end

  def create
    @child = parent_user.children.new(child_params) 
    if @child.save
      redirect_to admin_children_path, notice: "「#{@child.name}」を作成しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @child.update(child_params)
      redirect_to admin_child_path(@child), notice: "「#{@child.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @child.destroy
    redirect_to admin_children_url, notice: "「#{@child.name}」を削除しました。"
  end

  private 
  def child_params
    params.require(:child).permit(:name, :email, :password, :password_confirmation)
  end

  def set_child
    @child = parent_user.children.find(params[:id])
  end
end
