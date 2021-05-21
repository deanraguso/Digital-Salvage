module ApplicationHelper
    # Checks that an authorized user is logged in, redirects with notice otherwise.
    def authorized_user?
        unless(user_signed_in?)
          # A user who hasn't signed in, shouldn't be able to view or interact with addresses.
          redirect_to root_path
        end
        # Ensure the current_user is only interacting with their own address.
        unless(@address.id == current_user.address_id)
          redirect_to root_path
        end
    end

    # If an object get's saved correctly, redirects to that objects show with a message.
    def save_redirector saved, object, message
        respond_to do |format|
          if saved
            format.json { render :show, status: :ok, location: object }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: object.errors, status: :unprocessable_entity }
          end
        end
    end
end
