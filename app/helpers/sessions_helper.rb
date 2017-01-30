module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authorize?(user=nil)
    user == current_user || admin?
  end

  def favorited?
    current_user.favorites.include?(@recipe)
  end

  def admin?
    current_user.admin
  end

  def logged_as_admin
    unless logged_in? && admin?
      redirect_to root_path, alert: "Acesso Negado"
    end
  end
end
