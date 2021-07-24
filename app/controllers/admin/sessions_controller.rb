# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_admin, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def reject_admin
    @admin = Admin.find_by(email: params[:admin][:email].downcase)
     if @admin
     else
       flash[:error] = "正しい情報を入力してください"
     end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
