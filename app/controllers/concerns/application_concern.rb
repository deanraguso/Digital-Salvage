module ApplicationConcern

    # Checks that an authorized user is logged in, redirects with notice otherwise.
    def authorized_user?
      unless(user_signed_in?)
        # A user who hasn't signed in, shouldn't be able to view or interact with addresses.
        redirect_to root_path, notice: "You must be logged in to view this page!"
      end
    end

end
