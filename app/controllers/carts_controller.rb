class CartsController < ApplicationController

  before_action :authenticate_customer!

  def show; end

  def add
    # byebug
    $redis.hincrby(current_customer_cart, params[:product_id], params[:quantity] || 1)
    flash.now[:notice] = "Item successfully added"
    respond_to do |format|
      format.js
      format.html do
        flash[:notice] = "Item successfully added"
        redirect_to cart_path
      end
    end
  end

  def remove
    $redis.hdel(current_customer_cart, params[:product_id])
    flash[:notice] = 'Item removed'
    redirect_to cart_path
  end

  def minus
    $redis.hincrby(current_customer_cart, params[:product_id], -1)
    $redis.hdel(current_customer_cart, params[:product_id]) if $redis.hget(current_customer_cart, params[:product_id]).to_i <= 0
    # flash[:notice] = "Quantity reduced"
    redirect_to cart_path
  end

  private

  def current_customer_cart
    "cart-#{current_customer.id}"
  end

end
