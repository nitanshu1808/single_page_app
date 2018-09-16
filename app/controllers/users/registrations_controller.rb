# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(configure_sign_up_params)
      if @user.save
        sign_in @user
      end
  end

  private

  def configure_sign_up_params
    params.require(:user).permit(:email, :user_name, :password)
  end

end
