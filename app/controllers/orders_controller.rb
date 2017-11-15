class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

end
