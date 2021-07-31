class ApplicationController < ActionController::Base
  # ユーザー認証などが行われる前に、configure~が実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # デフォルトにないname/join_yearを追加しているので、それらを許可するよう記載している
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:join_year])
  end
  
end
