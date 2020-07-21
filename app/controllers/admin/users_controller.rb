class Admin::UsersController < Admin::BaseController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_children, only: [:show, :edit, :update, :destroy]

  def index
    # 紐付く子供アカウントの支出を取得
    @users = User.find(parent_user.id).children
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    # parent_userの場合は、親権者のIDをparent_idとして子供アカウントを作成
    if parent_user
      @user = parent_user.children.new(user_params) 
    # parent_user以外は、parent_idをnilでとして、親権者アカウントを作成
    else
      @user = User.new(user_params)
    end

    if @user.save
      redirect_to admin_users_path, notice: "「#{@user.name}」を作成しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: "「#{@user.name}」を削除しました。"
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def set_children
    @user = User.find(parent_user.id).children.find(params[:id])
  end

end