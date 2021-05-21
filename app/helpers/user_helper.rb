module UserHelper
    def object_fail_save_message saved, object
        unless saved
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: object.errors, status: :unprocessable_entity }
        end
    end

    def correct_password_check pw
        unless current_user.valid_password? pw
            flash.alert = "Error: Password Incorrect!"
            redirect_to edit_user_registration_path
            return nil
        end
        return true
    end
end