class ProductsController < ApplicationController

  # before_action :authenticate_customer!

  def index
    if customer_signed_in?
      if session[:cart]
        current_customer.add_to_cart_from_session(session[:cart])
        session[:cart] = nil
      end
    end
    @products = Product.all
  end

  def show
    if customer_signed_in?
      if session[:cart]
        current_customer.add_to_cart_from_session(session[:cart])
        session[:cart] = nil
      end
    end
    @product = Product.find(params[:id])
  end


end
