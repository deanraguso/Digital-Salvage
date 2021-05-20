class PaymentsController < ApplicationController
  before_action :item_check, only: [:success, :cancelled]

  def success
    @item = Item.find(params[:item_id])
    @order = Order.create!(status:1, user_id: current_user.id, item_id: params[:item_id])
    
    # Set item status to sold!
    @item.update(status: false)
  end

  def failure
  end

  def cancelled
  end

  protected
  def item_check
    unless params.has_key?(:item_id)
      redirect_to payments_failure_path, notice: "No Item Id was found!"
    end
  end

end
