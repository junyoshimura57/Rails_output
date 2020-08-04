class Admin::UsersController < Admin::BaseController
  skip_before_action :login_required, only: [:new, :create]
  # before_action :set_children, only: [:show, :edit, :update, :destroy]

  # def show
  # end

  def new
    @user = User.new
  end

  # def edit
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "「#{@user.name}」を作成しました。"
    else
      render :new
    end
  end

  # def update
  #   if @user.update(user_params)
  #     redirect_to admin_user_path(@user), notice: "「#{@user.name}」を更新しました。"
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   @user.destroy
  #   redirect_to admin_users_url, notice: "「#{@user.name}」を削除しました。"
  # end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # def set_children
  #   @user = User.find(parent_user.id).children.find(params[:id])
  # end

end