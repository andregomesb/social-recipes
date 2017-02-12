class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: session_email)
    if @user && @user.authenticate(session_password)
      log_in @user
      redirect_to @user, notice: 'Logado com sucesso'
    else
      flash[:alert] = 'Usuário ou senha inválido'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'Logout com sucesso'
  end

  private

  def session_email
    params[:session][:email].downcase
  end

  def session_password
    params[:session][:password]
  end
end
