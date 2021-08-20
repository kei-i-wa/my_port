# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy_confirm
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
    @departments = Department.all
  end

  def after_sign_up_path
    posts_path
  end

  # def create
  #     @user=User.new(configure_permitted_parameters)
  #     if @user.save
  #     redirect_to posts_path
  #     else
  #     render :new
  #     end
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create

  #   super

  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # private
  # def configure_permitted_parameters
  #     # デフォルトにないname/join_year/部署を追加しているので、それらを許可するよう記載している
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:join_year,:department_id])
  # end
  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to posts_path, notice: 'ゲストユーザーは削除できません。'
    end
  end
end
