# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @user = User.new
  end

  # POST /resource/sign_in
  def create
    @user = User.find_by(email: configure_sign_in_params["email"])
      if @user && @user.valid_password?(configure_sign_in_params["password"])
        flash.now[:notice] = I18n.t("devise.sessions.signed_in")
        sign_in @user
      else
        @user = @user || User.new(signin_params)
        @user.errors.add(:password, I18n.t('invalid_credentials'))
      end
  end

  private

  def configure_sign_in_params
    params.require(:user).permit(:email, :password)
  end

end
