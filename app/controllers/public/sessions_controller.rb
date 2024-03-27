# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :authenticate_customer!
  # before_action :configure_sign_in_params, only: [:create]
  
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to public_customer_path(customer), notice: "guestcustomerでログインしました。"
  end
  
  

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  private
  
  def after_sign_in_path_for(resource_or_scope)
    public_customer_path(resource_or_scope)
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_customer_session_path
  end
end
