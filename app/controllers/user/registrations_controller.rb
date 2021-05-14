# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    address_params = params[:address].permit(:country, :state, :postal_code, :street_address, :premise, :sub_premise)
    address = Address.new(address_params)

    # Save address first, explicitly, so I can user it's id.
    unless address.save
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: address.errors, status: :unprocessable_entity }
    end

    user_params = params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation).merge(:address_id => address.id)
    user = User.new(user_params)

    if user.save!
      sign_in(user)

    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: user.errors, status: :unprocessable_entity }
    end

    redirect_to root_path
  end

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
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
