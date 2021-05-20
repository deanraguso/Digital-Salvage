class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.all
  end

  def show
  end

  def new
  end

  def create
  end
end
