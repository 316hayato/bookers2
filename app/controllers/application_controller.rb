class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    flash[:success] = "Welcome! You have signed up successfully."
    # 新規登録後のページ
    user_path(current_user.id)
  end

  def after_sign_in_path_for(resource)
    flash[:success] = "Signed in successfully."
    # ログイン後のページ
    user_path(current_user.id)
  end
  
  def after_sign_out_path_for(resource)
    flash[:success] = "Signed out successfully."
    # ログアウト後のページ
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
