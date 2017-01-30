class UsersController < ApplicationController
  before_action :ignore_password, only:[:update]
  before_action :set_user, only:[:show, :edit, :update, :show_recipes, :destroy]

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
      render :edit
    end
  end

  def show
    @favorites = @user.favorites.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('.success')
    else
      flash[:alert] = t('.error')
      render :edit
    end
  end

  def show_recipes
    unless authorize? @user
      redirect_to root_path, alert: 'Acesso Negado'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Usuário deletado com sucesso'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :facebook, :twitter)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ignore_password
    if user_params[:password].empty? && user_params[:password_confirmation].empty?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
  end
end
