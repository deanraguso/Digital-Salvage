# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  include UserHelper
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    # Save address first, explicitly, so I can user it's id.
    address_params = params[:address].permit(:country, :state, :postal_code, :street_address, :premise, :sub_premise)
    address = Address.new(address_params)
    address_saved = address.save
    object_fail_save_message address_saved, address

    user_params = params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation).merge(:address_id => address.id)
    user = User.new(user_params)
    user_saved = user.save
    object_fail_save_message user_saved, user
    user_saved || sign_in(user)

    redirect_to root_path
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    correct_password_check account_update_params[:current_password]
    
    pw_params = params[:user].permit(:current_password, :password, :password_confirmation)
    # Handle updating password if they added anything.
    if (current_user.valid_password?(pw_params[:password]) || current_user.valid_password?(pw_params[:password_confirmation]))
      # Passwords are the same, do nothing.
    elsif (pw_params[:password] == pw_params[:password_confirmation] && pw_params[:password].length > 6)
      # Password are different.
      current_user.password = pw_params[:password]
      current_user.password_confirmation = pw_params[:password_confirmation]
      current_user.save!
      flash.alert = "Success: Password has been changed!"
    end

    # Update the other variables.
    user_params = params[:user].except(:current_password, :password, :password_confirmation).permit(:first_name, :last_name, :email)
    unless current_user.update( first_name: user_params[:first_name],
                                last_name: user_params[:last_name],
                                email: user_params[:email])
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: current_user.errors, status: :unprocessable_entity }
    end

    flash.alert = "Success: Account has been updated!"
    redirect_to edit_user_registration_path
  end

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
