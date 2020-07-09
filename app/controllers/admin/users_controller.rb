class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def show
    @user = User.find(prams[:id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "「#{@user.name}」を作成しました。"
    else
      render :new
    end
  end

  def update
    @user = USer.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "「#{@user.name}」を削除しました。"
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end