class UsersController < ApplicationController

  def show
    if User.exists?(:id => params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Media App!"
      redirect_to @user
    else
      render "new"
    end
  end

  private

  def user_params
    # セキュリティが向上する
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
