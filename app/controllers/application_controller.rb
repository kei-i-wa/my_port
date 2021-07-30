class ApplicationController < ActionController::Base
  # ユーザー認証などが行われる前に、configure~が実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # デフォルトにないnameを追加しているので、nameを許可するよう記載している
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
