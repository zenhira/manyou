module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
      current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def authenticate_user
    if current_user == nil
      flash[:nbotice] = "ログインが必要です"
      redirect_to new_session_path
    end
  end

  def logout_recomend
    if logged_in?
      flash[:notice] = "ログアウトしてください"
      redirect_to users_path
    end
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to tasks_path
    end
  end

  def admin_user
    redirect_to tasks_path, notice: '管理者権限がありません' unless current_user.admin?
  end

  def admin_user_new_or_edit
    if action_name == 'new' || action_name == 'create' 
      admin_users_path
    elsif action_name == 'edit'
      admin_user_path
    end
  end
  
end