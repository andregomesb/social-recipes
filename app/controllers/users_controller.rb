class UsersController < ApplicationController
  before_action :set_user, only:[:show, :recipes, :show_recipes]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, notice: t('.success')
    else
      flash[:alert] = t('.error')
      render 'new'
    end
  end

  def show
  end

  def show_recipes
    unless authorize? @user
      redirect_to root_path, alert: 'Acesso Negado'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
