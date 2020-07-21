class ApplicationController < ActionController::Base
  helper_method :current_user, :parent_user, :child_user
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # 親権者アカウントを取得するメソッドを定義
  def parent_user
    @parent_user ||= @current_user unless current_user&.parent_id
  end

  # 子供アカウントを取得するメソッドを定義
  def child_user
    @child_user ||= @current_user if current_user&.parent_id
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
