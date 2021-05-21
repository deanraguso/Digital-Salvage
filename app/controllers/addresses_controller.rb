class AddressesController < ApplicationController
  include ApplicationHelper
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :authorized_user?
  # GET /addresses/1 or /addresses/1.json
  def show
    redirect_to edit_address_path(@address)
  end

  # GET /addresses/1/edit
  def edit
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    saved = @address.update!(address_params)
    save_redirector saved, @address, "Address was successfully updated."
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
end
