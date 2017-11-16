class CartsController < ApplicationController

  def show
    if customer_signed_in?
      if session[:cart]
        current_customer.add_to_cart_from_session(session[:cart])
        session[:cart] = nil
      end
      @cart_items = current_customer.cart_items
      @cart_total_price = current_customer.cart_total_price
    elsif session[:cart]
      @cart_items = session[:cart].transform_keys do |product_id|
        Product.find(product_id)
      end
      @cart_total_price = @cart_items.reduce(0) do |sum, (product, quantity)|
        sum + (product.selling_price * quantity.to_i)
      end
    end
  end

  def add
    if customer_signed_in?
      $redis.hincrby(current_customer.cart_key, params[:product_id], params[:quantity] || 1)
    else
      session[:cart] ||= Hash.new
      session[:cart][params[:product_id]] = session[:cart].fetch(params[:product_id], 0) + (params[:quantity].try(:to_i) || 1)
    end

    @link_id = "#add-to-cart-#{params[:product_id]}"
    respond_to do |format|
      format.js
      format.html do
        flash[:notice] = "Item successfully added"
        redirect_to cart_path
      end
    end
  end

  def remove
    if customer_signed_in?
      $redis.hdel(current_customer.cart_key, params[:product_id])
    else
      session[:cart].delete(params[:product_id])
    end
    flash[:notice] = 'Item removed'
    redirect_to cart_path
  end

  def minus
    if customer_signed_in?
      $redis.hincrby(current_customer.cart_key, params[:product_id], -1)
      $redis.hdel(current_customer.cart_key, params[:product_id]) if $redis.hget(current_customer.cart_key, params[:product_id]).to_i <= 0
    else
      session[:cart][params[:product_id]] -= 1
      session[:cart].delete(params[:product_id]) if session[:cart][params[:product_id]] <= 0
    end
    # flash[:notice] = "Quantity reduced"
    redirect_to cart_path
  end

end
