class CartsController < ApplicationController

  before_action :authenticate_customer!

  def show; end

  def add
    $redis.hincrby(current_customer_cart, params[:product_id], 1)
    flash.now[:notice] = "Item successfully added"
    respond_to do |format|
      format.js
    end
  end

  def remove
    $redis.hdel(current_customer_cart, params[:product_id])
    flash[:notice] = 'Item removed'
    redirect_to cart_path
  end

  private

  def current_customer_cart
    "cart-#{current_customer.id}"
  end

end
