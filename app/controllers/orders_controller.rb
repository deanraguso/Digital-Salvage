class OrdersController < ApplicationController
  before_action :user_check

  def index
    @orders = current_user.orders.all.includes(:item, :user, item: [:user, images_attachments: :blob], ).sort_by { |o| -o.created_at.to_i }
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  protected
  def user_check
    unless user_signed_in?
      redirect_to new_user_session_path, notice: "You cannot access this page without being signed in!"
    end
  end

end
