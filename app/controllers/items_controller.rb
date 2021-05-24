class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :item_owner?, only: [:edit, :update, :destroy]

  # GET /items or /items.json
  def index
    @items = current_user.items.all.includes(images_attachments: :blob)
  end

  def search
    require 'constants'
    @items = Item.all.includes(images_attachments: :blob)
    @part_types = Constants::PART_TYPES
  end

  # GET /items/1 or /items/1.json
  def show

    @item = Item.find(params[:id])

    if(user_signed_in?)
      @session = Stripe::Checkout::Session.create(
        success_url: "#{payments_success_url}?item_id=#{@item.id}",
        cancel_url: "#{payments_failure_url}",
        customer_email: current_user.email,
        payment_method_types: ['card'],
        line_items: [{
          # For metered billing, do not pass quantity
          currency: 'AUD',
          quantity: 1,
          name:@item.description,
          amount: @item.price.to_i*100,
        }],
        payment_intent_data: {
          metadata: {
            dish_id: @item.id
          }
        }
      )
    end
  end

  # GET /items/new
  def new
    require 'constants'
    @item = Item.new
    @part_types = Constants::PART_TYPES
  end

  # GET /items/1/edit
  def edit
    require 'constants'
    @part_types = Constants::PART_TYPES
  end

  # POST /items or /items.json
  def create
    @part_types = Constants::PART_TYPES
    @item = Item.new(item_params.merge(user_id: current_user.id))
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @part_types = Constants::PART_TYPES
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:id, :price, :condition, :description, :seller_id, :part_type, images: [])
    end

    # Only the item owner may delete or edit an item.
    def item_owner?
      unless user_signed_in?  && !current_user.items.find_by(id: params[:id]).nil?
        flash.alert = "You are not authorized to access that!"
        redirect_to root_path
      end
    end
end
