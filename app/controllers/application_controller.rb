class ApplicationController < ActionController::Base
  # ユーザー認証などが行われる前に、configure~が実行される
  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    posts_path
  end



  protected

  def configure_permitted_parameters
    # デフォルトにないname/join_year/部署を追加しているので、それらを許可するよう記載している
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:join_year,:department_id])
  end

end
