class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :authorized_user?, excpet: 

  # GET /addresses/1 or /addresses/1.json
  def show
    redirect_to edit_address_path(@address)
  end

  # GET /addresses/1/edit
  def edit
  end

  def create
    @address = Address.new(address_params)
    save_responder "Address was successfully created."
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    save_responder "Address was successfully updated."
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:country, :state, :postal_code, :street_address, :premise, :sub_premise)
    end

    # Only an authorized user may view or edit their own address
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

    # Save an update or creation, respond with notice.
    def save_responder message
      respond_to do |format|
        if @address.save!
          format.html { redirect_to @address, notice: message }
          format.json { render :show, status: :ok, location: @address }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
end
